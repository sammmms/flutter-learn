import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var valueCheckbox = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Oh yes"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio(
                value: "Halo", 
                groupValue: valueCheckbox, 
                onChanged: (value){
                  setState(() {
                    valueCheckbox = value!;
                  });
                }),
                Text("Halo")
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio(
                value: "Hi", 
                groupValue: valueCheckbox, 
                onChanged: (value){
                  setState(() {
                    valueCheckbox = value!;
                  });
                }),
                Text("Hi")
            ],
          ),
          Text(valueCheckbox)
          ]
    ));
  }
}