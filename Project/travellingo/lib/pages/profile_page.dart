import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:travellingo/bloc/user.dart';
import 'package:travellingo/bloc/user_bloc.dart';
import 'package:travellingo/pages/personal_info_page.dart';
import 'package:travellingo/preferences/reset_preferences.dart';
import 'package:travellingo/provider/user_detail_provider.dart';
import 'package:travellingo/pages/signin_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final bloc = UserBloc();

  @override
  void initState() {
    SharedPreferences.getInstance().then((value) {
      bloc.getUser(value.getString('token')!, context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          "profile".getString(context),
          style: const TextStyle(fontWeight: FontWeight.bold),
        )),
        body: StreamBuilder<User>(
            stream: bloc.controller.stream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: const Center(child: CircularProgressIndicator()));
              }
              User data = snapshot.data!;
              return SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(90),
                                child: Badge(
                                    alignment: Alignment.bottomRight,
                                    smallSize: 34,
                                    backgroundColor: Colors.yellow,
                                    label: const Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                    ),
                                    largeSize: 30,
                                    child: DottedBorder(
                                      strokeWidth: 3,
                                      color: const Color(0xFFF6F8FB),
                                      dashPattern: [9, 7],
                                      borderType: BorderType.Circle,
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: CircleAvatar(
                                          radius: 50,
                                          backgroundColor:
                                              const Color(0xFFF6F8FB),
                                          child: data.pictureLink != ""
                                              ? Image.memory(base64Decode(
                                                  data.pictureLink!))
                                              : null,
                                        ),
                                      ),
                                    )),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              data.name,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              textScaler: const TextScaler.linear(1.1),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(data.email)
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "account".getString(context).toUpperCase(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, letterSpacing: 1),
                          textScaler: const TextScaler.linear(0.9),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Provider.of<UserDetailProvider>(context,
                                  listen: false)
                              .changeUser(data);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const PersonalInfoPage()));
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("personalInfo".getString(context)),
                              const Icon(Icons.arrow_forward_ios)
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("privacynsharing".getString(context)),
                            const Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                      ),
                      const Divider(
                        height: 1,
                        color: Color(0xFFF6F8FB),
                        indent: 20,
                        endIndent: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "settings".getString(context).toUpperCase(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, letterSpacing: 1),
                          textScaler: const TextScaler.linear(0.9),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("notification".getString(context)),
                            const Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("purchaseHistory".getString(context)),
                            const Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("appearance".getString(context)),
                            const Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("review".getString(context)),
                            const Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          context.read<UserDetailProvider>().user = null;
                          ResetPreferences.removeToken();
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => const SignInPage()),
                              (route) => false);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("logout".getString(context),
                                  style:
                                      const TextStyle(color: Colors.redAccent)),
                            ],
                          ),
                        ),
                      ),
                    ]),
              );
            }));
  }
}
