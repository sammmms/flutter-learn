import 'package:flutter/material.dart';
import 'package:m03_teori/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController t1 = TextEditingController();
  var isInvalid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Contoh Text Field"),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(children: [
                    const TextField(
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueAccent)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueAccent)),
                          labelText: "Nama",
                          hintText: "Isikan nama kamu disini",
                          prefixIcon: Icon(Icons.person)),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextField(
                      controller: t1,
                      decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueAccent)),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueAccent)),
                          labelText: "Password",
                          hintText: "Isikan password kamu disini",
                          errorText: isInvalid ? "Wrong Password" : null,
                          prefixIcon: const Icon(Icons.lock)),
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const TextField(
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueAccent)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueAccent)),
                          labelText: "Alamat",
                          hintText: "Isikan alamat kamu disini",
                          prefixIcon: Icon(Icons.home)),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    ElevatedButton(
                      onPressed: () => {
                        setState(() {
                          if (t1.text == "password123") {
                            isInvalid = false;
                            t1.text = "";
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const Home()));
                          } else {
                            isInvalid = true;
                            t1.text = "";
                          }
                        })
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white),
                      child: const Text("Continue"),
                    )
                  ]))
            ]));
  }
}
