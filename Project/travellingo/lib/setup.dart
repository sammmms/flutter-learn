import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';
import 'package:travellingo/data.dart';
import 'package:travellingo/provider.dart';
import 'package:travellingo/signin.dart';

class Setup extends StatefulWidget {
  final String email;
  const Setup({super.key, required this.email});

  @override
  State<Setup> createState() => _SetupState();
}

class _SetupState extends State<Setup> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController confirmEmail = TextEditingController();
  TextEditingController currentNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController birthday = TextEditingController(text: "2001-01-01");
  String currentCountry = "62";
  bool isObstructed = true;
  bool isAgreeing = false;
  final globalKey = GlobalKey<FormState>();
  final emailregex = RegExp(r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "setupyouraccount".getString(context).toUpperCase(),
            style: const TextStyle(
                fontSize: 13.5,
                letterSpacing: 1.1,
                fontWeight: FontWeight.bold),
            textScaler: const TextScaler.linear(1.1),
          ),
          scrolledUnderElevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Color(0xFFF5D161)),
          foregroundColor: const Color(0xFF1B1446),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: globalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("firstName".getString(context),
                      style: const TextStyle(
                          fontSize: 10,
                          letterSpacing: 1.1,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1B1446)),
                      textScaler: const TextScaler.linear(1.1)),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "fieldmustbefilled".getString(context);
                        }
                        return null;
                      },
                      controller: firstName,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]')),
                      ],
                      style: const TextStyle(
                          color: Color(0xFF1B1446), letterSpacing: 1.1)),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "lastName".getString(context),
                    style: const TextStyle(
                      fontSize: 10,
                      letterSpacing: 1.1,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1B1446),
                    ),
                    textScaler: const TextScaler.linear(1.1),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      controller: lastName,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "fieldmustbefilled".getString(context);
                        }
                        return null;
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]')),
                      ],
                      style: const TextStyle(
                          color: Color(0xFF1B1446), letterSpacing: 1.1)),
                  const SizedBox(
                    height: 20,
                  ),
                  Text("email".getString(context),
                      style: const TextStyle(
                          fontSize: 10,
                          letterSpacing: 1.1,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1B1446)),
                      textScaler: const TextScaler.linear(1.1)),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      decoration: InputDecoration(
                        enabled: false,
                        hintText: widget.email,
                        fillColor: const Color(0xFFF6F8FB),
                      ),
                      style: const TextStyle(
                          color: Color(0xFF1B1446), letterSpacing: 1.1)),
                  const SizedBox(
                    height: 20,
                  ),
                  Text("confirmEmail".getString(context),
                      style: const TextStyle(
                          fontSize: 10,
                          letterSpacing: 1.1,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1B1446)),
                      textScaler: const TextScaler.linear(1.1)),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      controller: confirmEmail,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value == "") {
                          return "fieldmustbefilled".getString(context);
                        }
                        if (!emailregex.hasMatch(value)) {
                          return "emailformatwrong".getString(context);
                        }
                        if (value != widget.email) {
                          return "emailisdifferent".getString(context);
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'[a-zA-Z@.0-9]'))
                      ],
                      style: const TextStyle(
                          color: Color(0xFF1B1446), letterSpacing: 1.1)),
                  const SizedBox(
                    height: 20,
                  ),
                  Text("phoneNumber".getString(context),
                      style: const TextStyle(
                          fontSize: 10,
                          letterSpacing: 1.1,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1B1446)),
                      textScaler: const TextScaler.linear(1.1)),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Theme(
                      data: Theme.of(context).copyWith(
                          canvasColor: const Color.fromRGBO(246, 248, 251, 1)),
                      child: SizedBox(
                        height: 56,
                        width: 100,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xFFF6F8FB),
                          ),
                          child: DropdownButton(
                              isExpanded: true,
                              padding: const EdgeInsets.only(left: 20),
                              value: currentCountry,
                              alignment: Alignment.center,
                              iconEnabledColor: const Color(0xFF0768FD),
                              dropdownColor: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              underline: Container(color: Colors.transparent),
                              items: listCountry.keys
                                  .map<DropdownMenuItem<String>>((items) {
                                return DropdownMenuItem(
                                    alignment: const Alignment(0, 0.4),
                                    value: listCountry[items].toString(),
                                    child: Row(
                                      children: [
                                        Text(listCountry[items].toString()),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Image.asset("assets/$items.png")
                                      ],
                                    ));
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  currentCountry = value.toString();
                                });
                              }),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: currentNumber,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value == "") {
                            return "fieldmustbefilled".getString(context);
                          }
                          if (value.length < 6) {
                            return "phoneformatwrong".getString(context);
                          }
                          return null;
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(11),
                        ],
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFFF6F8FB),
                            prefix: Text(
                              "$currentCountry - ",
                            )),
                      ),
                    ),
                  ]),
                  const SizedBox(
                    height: 20,
                  ),
                  Text("birthday".getString(context),
                      style: const TextStyle(
                          fontSize: 10,
                          letterSpacing: 1.1,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1B1446)),
                      textScaler: const TextScaler.linear(1.1)),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      showDatePicker(
                              context: context,
                              firstDate: DateTime(1950),
                              lastDate: DateTime.now())
                          .then((value) {
                        if (value == null || value.toString() == "") {
                          return;
                        }
                        birthday.text = value.toString().split(' ')[0];
                      });
                    },
                    child: TextFormField(
                      enabled: false,
                      controller: birthday,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Icon(Icons.calendar_month),
                          ),
                          suffixIconColor: Color(0xFFF5D161)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text("password".getString(context),
                      style: const TextStyle(
                          fontSize: 10,
                          letterSpacing: 1.1,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1B1446)),
                      textScaler: const TextScaler.linear(1.1)),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "fieldmustbefilled".getString(context);
                        }
                        if (value.length < 8) {
                          return "passwordformatwrong".getString(context);
                        }
                        return null;
                      },
                      controller: password,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFFF6F8FB),
                          suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  isObstructed = !isObstructed;
                                });
                              },
                              overlayColor: const MaterialStatePropertyAll(
                                  Colors.transparent),
                              child: Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: isObstructed
                                    ? const Icon(Icons.visibility,
                                        color: Color(0xFFF5D161))
                                    : const Icon(Icons.visibility_off,
                                        color: Color(0xFFF5D161)),
                              ))),
                      obscureText: isObstructed,
                      style: const TextStyle(
                          color: Color(0xFF1B1446), letterSpacing: 1.1)),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Checkbox(
                        value: isAgreeing,
                        onChanged: (value) {
                          setState(() {
                            isAgreeing = !isAgreeing;
                          });
                        },
                        shape: const CircleBorder(),
                        fillColor:
                            const MaterialStatePropertyAll(Colors.transparent),
                        checkColor: const Color(0xFFF5D161),
                        side: MaterialStateBorderSide.resolveWith((states) =>
                            const BorderSide(
                                width: 2.0,
                                color: Color.fromARGB(255, 245, 209, 97)))),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "travellingoterms".getString(context),
                          style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1B1446)),
                          textScaler: const TextScaler.linear(1.1),
                        ),
                        !isAgreeing
                            ? Text("termsagree".getString(context),
                                style: const TextStyle(
                                    color: Colors.redAccent, fontSize: 10))
                            : const SizedBox(),
                      ],
                    )
                  ]),
                  const SizedBox(
                    height: 40,
                  ),
                  OutlinedButton(
                      onPressed: () {
                        setState(
                          () {
                            if (globalKey.currentState!.validate()) {
                              Provider.of<UserProvider>(context, listen: false)
                                  .addUser(User(
                                      email: confirmEmail.text,
                                      name:
                                          "${firstName.text} ${lastName.text}",
                                      phone:
                                          currentCountry + currentNumber.text,
                                      birthday: birthday.text,
                                      password: password.text));
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => const SignIn()),
                                (route) => false,
                              );
                            }
                          },
                        );
                      },
                      child: Text("continue".getString(context),
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              letterSpacing: 1.1),
                          textScaler: const TextScaler.linear(1.1)))
                ],
              ),
            ),
          ),
        ));
  }
}
