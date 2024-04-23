import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';
import 'package:travellingo/component/snackbar_component.dart';
import 'package:travellingo/provider/user_detail_provider.dart';
import 'package:travellingo/pages/signin_page.dart';
import 'package:travellingo/utils/route_push.dart';

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({super.key});

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  final name = TextEditingController();
  final gender = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final govId = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final user = context.read<UserDetailProvider>().user;
    if (user == null) {
      showMySnackBar(context, "tokenExpired".getString(context));
      handlePushRemove(context, const SignInPage());
    }
    name.text = user!.name;
    email.text = user.email;
    gender.text = user.gender.toString().getString(context);
    phone.text = user.phone;
    govId.text = user.id ?? "";
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
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            child: Column(
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
                  controller: gender,
                  decoration: InputDecoration(
                      enabled: user.gender == "" ? true : false,
                      filled: false,
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFF6F8FB), width: 2),
                          borderRadius: BorderRadius.circular(20)),
                      disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFF6F8FB), width: 2),
                          borderRadius: BorderRadius.circular(20)),
                      labelText: "gender".getString(context).toUpperCase()),
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
                        labelText: "email".getString(context).toUpperCase())),
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
                        labelText:
                            "phoneNumber".getString(context).toUpperCase())),
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
                        labelText: "govId".getString(context).toUpperCase())),
              ],
            ),
          ),
        ));
  }
}
