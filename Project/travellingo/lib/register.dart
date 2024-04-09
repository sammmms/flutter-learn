import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:travellingo/setup.dart';
import 'package:travellingo/signin.dart';

Route _createRoute(String userEmail) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        Setup(email: userEmail),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(position: animation.drive(tween), child: child);
    },
  );
}


class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final FlutterLocalization localization = FlutterLocalization.instance;
  var isError = false;
  final emailregex = RegExp(r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])');
  @override
  Widget build(BuildContext context) {
    bool isEnglish =
        localization.currentLocale.localeIdentifier == "en" ? true : false;
    TextEditingController email =
        TextEditingController(text: "221110058@students.mikroskil.ac.id");
    final globalKey = GlobalKey<FormState>();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "changeLanguage".getString(context),
            style: const TextStyle(color: Colors.black26),
          ),
          scrolledUnderElevation: 0,
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Switch(
                inactiveThumbImage: const AssetImage('assets/Indonesia.png'),
                inactiveTrackColor: Colors.red[100],
                inactiveThumbColor: Colors.red[100],
                activeThumbImage: ResizeImage(AssetImage('assets/US.png'),
                    height: 16, width: 22),
                activeTrackColor: Colors.blue[100],
                trackOutlineColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.selected)) {
                    return const Color.fromARGB(255, 62, 132, 168);
                  }
                  return Colors.red[300];
                }),
                overlayColor:
                    const MaterialStatePropertyAll(Colors.transparent),
                activeColor: Colors.blue[100],
                value: isEnglish,
                onChanged: (value) {
                  setState(() {
                    isEnglish = value;
                    if (isEnglish) {
                      localization.translate('en');
                    } else {
                      localization.translate('id');
                    }
                  });
                },
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
                padding: const EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height,
                width: 500,
                child: Form(
                  key: globalKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(child: Image.asset("assets/Signup.png")),
                        const SizedBox(
                          height: 40,
                        ),
                        Text(
                          "email".getString(context),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Color(0xFF1B1446),
                              fontWeight: FontWeight.bold,
                              fontFamily: "DM Sans",
                              fontSize: 14,
                              letterSpacing: 1),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value == "") {
                              return "fieldmustbefilled".getString(context);
                            }
                            if (!emailregex.hasMatch(value)) {
                              return "emailformatwrong".getString(context);
                            }
                            return null;
                          },
                          controller: email,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[a-zA-Z@.0-9]'))
                          ],
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                            Icons.account_circle,
                            color: Color.fromARGB(255, 62, 132, 168),
                          )),
                          style: const TextStyle(
                              color: Color(0xFF1B1446),
                              fontSize: 14,
                              letterSpacing: 1.1,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              if (email.text != "") {
                                Navigator.of(context)
                                    .push(_createRoute(email.text));
                                isError = false;
                              } else {
                                setState(() {
                                  isError = true;
                                });
                              }
                            },
                            style: const ButtonStyle(
                                minimumSize: MaterialStatePropertyAll(
                                    Size(double.infinity, 52)),
                                backgroundColor:
                                    MaterialStatePropertyAll(Color(0xFFF5D161)),
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16))))),
                            child: Text(
                              "signup".getString(context),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 11.5,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.1),
                              textScaler: const TextScaler.linear(1.1),
                            )),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(children: [
                          Expanded(
                              child: Container(
                            height: 2,
                            color: const Color(0xFFF6F8FB),
                          )),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                  "orsignupwith"
                                      .getString(context)
                                      .toUpperCase(),
                                  style: const TextStyle(
                                      fontSize: 9,
                                      letterSpacing: 1.1,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xAA1B1446)),
                                  textScaler: const TextScaler.linear(1.1))),
                          Expanded(
                              child: Container(
                            height: 2,
                            color: const Color(0xFFF6F8FB),
                          )),
                        ]),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {},
                              overlayColor: const MaterialStatePropertyAll(
                                  Colors.transparent),
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Colors.grey.shade200,
                                          style: BorderStyle.solid)),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Image.asset("assets/Facebook.png",
                                      width: 20)),
                            ),
                            InkWell(
                              onTap: () {},
                              overlayColor: const MaterialStatePropertyAll(
                                  Colors.transparent),
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Colors.grey.shade200,
                                          style: BorderStyle.solid)),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Image.asset("assets/Google.png",
                                      width: 20)),
                            ),
                            InkWell(
                              onTap: () {},
                              overlayColor: const MaterialStatePropertyAll(
                                  Colors.transparent),
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Colors.grey.shade200,
                                          style: BorderStyle.solid)),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Image.asset("assets/Apple.png",
                                      width: 20)),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("alreadyhaveaccount".getString(context),
                                  style:
                                      const TextStyle(color: Colors.black26)),
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SignIn()));
                                  },
                                  child: Text("signin".getString(context),
                                      style: const TextStyle(
                                          color: Color(0xFFF5D161))))
                            ])
                      ]),
                )),
          ),
        ));
  }
}
