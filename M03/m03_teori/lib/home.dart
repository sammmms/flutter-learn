import 'package:flutter/material.dart';
import 'package:m03_teori/login.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Center(
          child: Column(children: [
        InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => const Login()));
            },
            child: const Icon(Icons.person))
      ])),
    );
  }
}
