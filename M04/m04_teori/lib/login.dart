import 'package:flutter/material.dart';
import 'package:m04_teori/home.dart';
import 'package:m04_teori/provider.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController t1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: t1,
            ),
            ElevatedButton(onPressed: (){
              Provider.of<UserProvider>(context, listen:false).changeName(t1.text);
              
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context)=>Home())
              );
            }, child: Text("Press me!"))
          ],
        ),
      )
    );
  }
}