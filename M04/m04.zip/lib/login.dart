// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:m02_praktek/home.dart';
import 'package:m02_praktek/provider.dart';
import 'package:m02_praktek/register.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController nama = TextEditingController();
  TextEditingController password = TextEditingController();
  var isError = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Center(
              child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(children: [
                    Image.asset(
                      'logo.png',
                      width: 200,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 400,
                      child: TextField(
                        onChanged: (a) {
                          setState(() {
                            isError = false;
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            label: Text("Username"),
                            errorText:
                                isError ? "Incorrect username or password" : null,
                            labelStyle: TextStyle(color: Colors.black54)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 400,
                      child: TextField(
                        onChanged: (a) {
                          setState(() {
                            isError = false;
                          });
                        },
                        controller: password,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.redAccent),
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            label: Text("Password"),
                            errorText:
                                isError ? "Incorrect username or password" : null,
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
                          Provider.of<UserProvider>(context, listen:false).listProfile.forEach((element) {
                            if(nama.text == element.username && password.text == element.password){
                              Provider.of<CurrentUser>(context, listen:false).profile = element;
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) => Home())
                              );
                            }
                          });
                          isError = true;
                        });
                      },
                      style: ButtonStyle(
                          minimumSize: MaterialStatePropertyAll(Size(400, 50)),
                          foregroundColor: MaterialStatePropertyAll(Colors.white),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      child: Text("Login"),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text("OR"),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStatePropertyAll(Colors.black54),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.white),
                            maximumSize: MaterialStatePropertyAll(Size(400, 50))),
                        onPressed: () {},
                        child: Center(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                              CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: 10,
                                  child: Image.asset("google.png")),
                              SizedBox(
                                width: 20,
                              ),
                              Text("Log in with Google")
                            ]))),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account? "),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => Register()));
                          },
                          child: Text(
                            "Sign up",
                            style: TextStyle(color: Colors.redAccent),
                          ),
                        )
                      ],
                    )
                  ]))),
        ));
  }
}
