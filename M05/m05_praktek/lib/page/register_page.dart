import 'package:flutter/material.dart';
import 'package:m02_praktek/page/home_page.dart';
import 'package:m02_praktek/page/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nama = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  var isError = false;
  var isErrorv2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(padding: const EdgeInsets.all(50), children: [
      Image.asset(
        'logo.png',
        width: 200,
        height: 200,
      ),
      const SizedBox(
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
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.redAccent),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              label: const Text("Username"),
              errorText: isErrorv2 ? "Username shouldn't be empty." : null,
              labelStyle: const TextStyle(color: Colors.black54)),
        ),
      ),
      const SizedBox(
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
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.redAccent),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              label: const Text("Password"),
              errorText: isError
                  ? "Password and Confirm Password is not the same."
                  : null,
              labelStyle: const TextStyle(color: Colors.black54)),
          obscureText: true,
        ),
      ),
      const SizedBox(
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
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.redAccent),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              label: const Text("Confirm Password"),
              errorText: isError
                  ? "Password and Confirm Password is not the same."
                  : null,
              labelStyle: const TextStyle(color: Colors.black54)),
          obscureText: true,
        ),
      ),
      const SizedBox(
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
                  MaterialPageRoute(builder: (context) => const Home()));
            }
          });
        },
        style: const ButtonStyle(
            minimumSize: MaterialStatePropertyAll(Size(400, 50)),
            foregroundColor: MaterialStatePropertyAll(Colors.white),
            backgroundColor: MaterialStatePropertyAll(Colors.redAccent)),
        child: const Text("Register"),
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
      ElevatedButton(
          style: const ButtonStyle(
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
            const SizedBox(
              width: 20,
            ),
            const Text("Register with Google")
          ]))),
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
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            },
            child: const Text(
              "Sign in",
              style: TextStyle(color: Colors.redAccent),
            ),
          )
        ],
      )
    ]));
  }
}
