import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:travellingo/utils/locales/locale.dart';
import 'package:travellingo/pages/signin_page.dart';
import 'package:travellingo/provider/user_detail_provider.dart';
import 'package:flutter_localization/flutter_localization.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FlutterLocalization localization = FlutterLocalization.instance;

  @override
  void initState() {
    localization.init(
      mapLocales: [
        const MapLocale('en', AppLocale.en),
        const MapLocale('id', AppLocale.id),
      ],
      initLanguageCode: 'en',
    );
    localization.onTranslatedLanguage = (locale) {
      setState(() {});
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserDetailProvider())
      ],
      child: MaterialApp(
        supportedLocales: localization.supportedLocales,
        localizationsDelegates: localization.localizationsDelegates,
        title: 'Travellingo',
        theme: ThemeData(
          fontFamily: "Poppins",
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: const Color(0xFFF6F8FB),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.transparent)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.transparent)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.redAccent)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.redAccent)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.transparent)),
          ),
          outlinedButtonTheme: const OutlinedButtonThemeData(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Color(0xFFF5D161)),
                  side: MaterialStatePropertyAll(
                      BorderSide(color: Colors.transparent)),
                  foregroundColor: MaterialStatePropertyAll(Colors.white))),
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFF5D161)),
          iconTheme: const IconThemeData(color: Color(0xFFF5D161)),
          primaryIconTheme: const IconThemeData(color: Color(0xFFF5D161)),
          useMaterial3: true,
        ),
        home: const SignInPage(),
      ),
    );
  }
}
