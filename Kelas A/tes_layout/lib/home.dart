// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todos"),
        centerTitle: true,
        leading: const Icon(Icons.arrow_back_ios),
      ),
      body: Column(
        children:const [
          Row(
            children:[
              Row(children: [
                Icon(Icons.list_alt),
                Text("Kegiatan")
              ],),
              TextField(
                decoration: InputDecoration(
                  
                ),
                maxLength: 100,
              )
            ]
          )
        ]
      )
    );
  }
}