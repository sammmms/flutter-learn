// ignore_for_file: prefer_const_constructors

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:m02_praktek/component/logo.dart';
import 'package:m02_praktek/component/outer_constraint.dart';
import 'package:m02_praktek/component/transition.dart';
import 'package:m02_praktek/models/user_model.dart';
import 'package:m02_praktek/page/main_page.dart';
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
  final nama = TextEditingController(text: "namesam_");
  final password = TextEditingController(text: "123");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: MediaQuery.of(context).size.width,
      child: OuterConstraint(
        mustCenter: true,
        child: Scrollbar(
          child: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Logo(),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Username shouldn't be empty";
                      }
                      return null;
                    },
                    controller: nama,
                    decoration: InputDecoration(
                      label: Text("Username"),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password shouldn't be empty";
                      }
                      return null;
                    },
                    controller: password,
                    decoration: InputDecoration(
                      label: Text("Password"),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        List<User> profile =
                            context.read<UserProvider>().listProfile;
                        User? user = profile.firstWhereOrNull(
                          (element) {
                            bool usernameMatched =
                                element.username == nama.text;
                            bool passwordMatched =
                                element.password == password.text;
                            return usernameMatched && passwordMatched;
                          },
                        );
                        if (user != null) {
                          context.read<CurrentUser>().profile = user;
                          Navigator.of(context)
                              .pushReplacement(slideInFromBottom(MainPage()));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Username or password is wrong."),
                            ),
                          );
                        }
                      },
                      style: ButtonStyle(
                        foregroundColor: MaterialStatePropertyAll(Colors.white),
                      ),
                      child: Text("Login"),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text("OR"),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.black54),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white),
                        ),
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
                  ),
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
                              slideInFromBottom(RegisterPage()));
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
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
