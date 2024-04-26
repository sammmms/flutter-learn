import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';
import 'package:travellingo/component/snackbar_component.dart';
import 'package:travellingo/pages/profile/widget/gender_radio.dart';
import 'package:travellingo/pages/sign_in/signin_page.dart';
import 'package:travellingo/provider/user_detail_provider.dart';

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({super.key});

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  final name = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final govId = TextEditingController();
  late String gender;

  @override
  void initState() {
    final user = context.read<UserDetailProvider>().user;
    if (user == null) {
      showMySnackBar(context, "tokenExpired".getString(context));
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const SignInPage()),
          (route) => false);
    }
    name.text = user!.name;
    email.text = user.email;
    gender = user.gender.toString();
    phone.text = user.phone;
    govId.text = user.id ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "personalInfo".getString(context),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          iconTheme: const IconThemeData(),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: InkWell(
                  child: Text(
                "edit".getString(context),
                style: const TextStyle(
                    color: Color(0xFFF5D161), fontWeight: FontWeight.bold),
              )),
            )
          ],
        ),
        body: StreamBuilder(
            stream: null,
            builder: (context, snapshot) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: name,
                        decoration: InputDecoration(
                            filled: false,
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xFFF6F8FB), width: 2),
                                borderRadius: BorderRadius.circular(20)),
                            labelText: "name".getString(context).toUpperCase()),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                          controller: email,
                          decoration: InputDecoration(
                              filled: false,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFF6F8FB), width: 2),
                                  borderRadius: BorderRadius.circular(20)),
                              labelText:
                                  "email".getString(context).toUpperCase())),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                          controller: phone,
                          decoration: InputDecoration(
                              filled: false,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFF6F8FB), width: 2),
                                  borderRadius: BorderRadius.circular(20)),
                              labelText: "phoneNumber"
                                  .getString(context)
                                  .toUpperCase())),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                          controller: govId,
                          decoration: InputDecoration(
                              filled: false,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFF6F8FB), width: 2),
                                  borderRadius: BorderRadius.circular(20)),
                              labelText:
                                  "govId".getString(context).toUpperCase())),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Text(
                          "gender".getString(context).toUpperCase(),
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                      GenderRadio(
                        gender: gender,
                      )
                    ],
                  ),
                ),
              );
            }));
  }
}
