import 'package:flutter/material.dart';
import 'package:m04_teori/provider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Text("Hewo! ${Provider.of<UserProvider>(context).username}")
      ],)
    );
  }
}