import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:m02_praktek/data/data_dummy.dart';
import 'package:m02_praktek/page/login_page.dart';
import 'package:m02_praktek/providers/provider.dart';
import 'package:m02_praktek/utils/dark_theme.dart';
import 'package:m02_praktek/utils/light_theme.dart';
import 'package:m02_praktek/utils/theme_utils.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final themeController =
      BehaviorSubject<ThemeSelection>.seeded(ThemeSelection.light);

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      final prefs = await SharedPreferences.getInstance();
      String? currentTheme = prefs.getString('theme');
      if (currentTheme != null) {
        themeController.add(ThemeSelectionUtils().themeStringOf(currentTheme));
      } else {
        themeController.add(ThemeSelection.light);
      }
    });
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => UserProvider(listProfile: [profile])),
        ChangeNotifierProvider(create: (context) => CurrentUser()),
        ChangeNotifierProvider(
          create: (context) => DarkModeProvider(controller: themeController),
        ),
        StreamProvider<ThemeSelection>.value(
          value: themeController,
          initialData: ThemeSelection.light,
        )
      ],
      child: StreamBuilder(
          stream: themeController.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                context.read<DarkModeProvider>().selectTheme(snapshot.data!);
              });
            }
            return MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: context.watch<DarkModeProvider>().theme ==
                      ThemeSelection.light
                  ? lightTheme
                  : darkTheme,
              home: const LoginPage(),
            );
          }),
    );
  }
}
