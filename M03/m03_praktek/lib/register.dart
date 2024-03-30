// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:m02_praktek/home.dart';
import 'package:m02_praktek/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController nama = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  var isError = false;
  var isErrorv2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(padding: EdgeInsets.all(50), children: [
      Image.asset(
        'logo.png',
        width: 200,
        height: 200,
      ),
      SizedBox(
        height: 30,
      ),
      SizedBox(
        width: 400,
        child: TextField(
          onTapOutside: (a) {
            setState(() {
              if (nama.text == "") {
                isErrorv2 = true;
              } else {
                isErrorv2 = false;
              }
            });
          },
          controller: nama,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.redAccent),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              label: Text("Username"),
              errorText: isErrorv2 ? "Username shouldn't be empty." : null,
              labelStyle: TextStyle(color: Colors.black54)),
        ),
      ),
      SizedBox(
        height: 20,
      ),
      SizedBox(
        width: 400,
        child: TextField(
          controller: password,
          onTapOutside: (a) {
            setState(() {
              if (password.text != confirmPassword.text) {
                isError = true;
              } else {
                isError = false;
              }
            });
          },
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.redAccent),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              label: Text("Password"),
              errorText: isError
                  ? "Password and Confirm Password is not the same."
                  : null,
              labelStyle: TextStyle(color: Colors.black54)),
          obscureText: true,
        ),
      ),
      SizedBox(
        height: 20,
      ),
      SizedBox(
        width: 400,
        child: TextField(
          onTapOutside: (a) {
            setState(() {
              if (password.text != confirmPassword.text) {
                isError = true;
              } else {
                isError = false;
              }
            });
          },
          controller: confirmPassword,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.redAccent),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              label: Text("Confirm Password"),
              errorText: isError
                  ? "Password and Confirm Password is not the same."
                  : null,
              labelStyle: TextStyle(color: Colors.black54)),
          obscureText: true,
        ),
      ),
      SizedBox(
        height: 30,
      ),
      ElevatedButton(
        onPressed: () {
          setState(() {
            if ((password.text != confirmPassword.text)) {
              isError = true;
            } else if (nama.text == "") {
              isErrorv2 = true;
            } else {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Home()));
            }
          });
        },
        style: ButtonStyle(
            minimumSize: MaterialStatePropertyAll(Size(400, 50)),
            foregroundColor: MaterialStatePropertyAll(Colors.white),
            backgroundColor: MaterialStatePropertyAll(Colors.redAccent)),
        child: Text("Register"),
      ),
      SizedBox(
        height: 30,
      ),
      Text(
        "OR",
        textAlign: TextAlign.center,
      ),
      SizedBox(
        height: 30,
      ),
      ElevatedButton(
          style: ButtonStyle(
              foregroundColor: MaterialStatePropertyAll(Colors.black54),
              backgroundColor: MaterialStatePropertyAll(Colors.white),
              maximumSize: MaterialStatePropertyAll(Size(400, 50))),
          onPressed: () {},
          child: Center(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 10,
                child: Image.asset("google.png")),
            SizedBox(
              width: 20,
            ),
            Text("Register with Google")
          ]))),
      SizedBox(
        height: 40,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Already have an account? "),
          InkWell(
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Login()));
            },
            child: Text(
              "Sign in",
              style: TextStyle(color: Colors.redAccent),
            ),
          )
        ],
      )
    ]));
  }
}
