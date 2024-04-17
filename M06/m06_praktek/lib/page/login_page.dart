// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:m02_praktek/page/home_page.dart';
import 'package:m02_praktek/providers/provider.dart';
import 'package:m02_praktek/page/register_page.dart';
import 'package:m02_praktek/utils/theme_utils.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nama = TextEditingController(text: "namesam_");
  TextEditingController password = TextEditingController(text: "123");
  var isError = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Center(
          child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(children: [
                Image.asset(
                  'assets/logo.png',
                  color: context.watch<DarkModeProvider>().theme ==
                          ThemeSelection.light
                      ? Colors.redAccent
                      : Colors.purpleAccent,
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
                      label: Text("Username"),
                      errorText:
                          isError ? "Incorrect username or password" : null,
                    ),
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
                      label: Text("Password"),
                      errorText:
                          isError ? "Incorrect username or password" : null,
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Provider.of<UserProvider>(context, listen: false)
                          .listProfile
                          .forEach((element) {
                        if (nama.text == element.username &&
                            password.text == element.password) {
                          Provider.of<CurrentUser>(context, listen: false)
                              .profile = element;
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => Home()));
                        }
                      });
                      isError = true;
                    });
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStatePropertyAll(Size(400, 50)),
                    foregroundColor: MaterialStatePropertyAll(Colors.white),
                  ),
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
                        backgroundColor: MaterialStatePropertyAll(Colors.white),
                        maximumSize: MaterialStatePropertyAll(Size(400, 50))),
                    onPressed: () {},
                    child: Center(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 10,
                              child: Image.asset("assets/google.png")),
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
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => RegisterPage()));
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                            color: context.watch<DarkModeProvider>().theme ==
                                    ThemeSelection.light
                                ? Colors.redAccent
                                : Colors.purpleAccent),
                      ),
                    )
                  ],
                )
              ]))),
    ));
  }
}
