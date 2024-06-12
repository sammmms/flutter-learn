import 'package:flutter/material.dart';
import 'package:m02_praktek/component/logo.dart';
import 'package:m02_praktek/component/outer_constraint.dart';
import 'package:m02_praktek/component/transition.dart';
import 'package:m02_praktek/models/user_model.dart';
import 'package:m02_praktek/page/login_page.dart';
import 'package:m02_praktek/providers/provider.dart';
import 'package:m02_praktek/utils/theme_utils.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nama = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
          body: OuterConstraint(
        child: Scrollbar(
          child: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Logo(),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Username shouldn't be empty";
                        }
                        return null;
                      },
                      controller: _nama,
                      decoration: const InputDecoration(
                        label: Text("Username"),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _password,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password shouldn't be empty";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        label: Text("Password"),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Confirm Password shouldn't be empty";
                        }
                        return null;
                      },
                      controller: _confirmPassword,
                      decoration: const InputDecoration(
                        label: Text("Confirm Password"),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (_password.text != _confirmPassword.text) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text(
                                    "Password and Confirm Password doesn't match"),
                              ));
                              return;
                            }
                            User user = User.create(_nama.text, _password.text);
                            context.read<UserProvider>().addUser(user);
                            Navigator.of(context).pushReplacement(
                                slideInFromBottom(const LoginPage()));
                          }
                        },
                        child: const Text("Register"),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "OR",
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                          style: const ButtonStyle(
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
                                const SizedBox(
                                  width: 20,
                                ),
                                const Text("Register with Google")
                              ]))),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account? "),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                slideInFromBottom(const LoginPage()));
                          },
                          child: Text(
                            "Sign in",
                            style: TextStyle(
                                color:
                                    context.watch<DarkModeProvider>().theme ==
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
      )),
    );
  }
}
