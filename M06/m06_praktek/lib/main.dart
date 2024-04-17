import 'package:flutter/material.dart';
import 'package:m02_praktek/data/data_dummy.dart';
import 'package:m02_praktek/page/login_page.dart';
import 'package:m02_praktek/providers/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => UserProvider(listProfile: [profile])),
        ChangeNotifierProvider(create: (context) => CurrentUser())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
          useMaterial3: true,
        ),
        home: const LoginPage(),
      ),
    );
  }
}
