import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:travellingo/bloc/user_bloc/user_state.dart';
import 'package:travellingo/component/snackbar_component.dart';
import 'package:travellingo/models/user.dart';
import 'package:travellingo/bloc/user_bloc/user_bloc.dart';
import 'package:travellingo/pages/profile/personal_info_page.dart';
import 'package:travellingo/bloc/preferences/reset_preferences.dart';
import 'package:travellingo/pages/profile/widget/text_navigator.dart';
import 'package:travellingo/provider/user_detail_provider.dart';
import 'package:travellingo/pages/sign_in/signin_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final bloc = UserBloc();

  @override
  void initState() {
    //Check for user token, is token is missing, then bump user to login page
    SharedPreferences.getInstance().then((value) {
      String? token = value.getString('token');
      if (token == null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showMySnackBar(context, "tokenExpired");
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const SignInPage()),
              (route) => false);
          return;
        });
      }
      bloc.getUser(token!, context);
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
        body: StreamBuilder<UserState>(
            stream: bloc.controller.stream,
            builder: (context, snapshot) {
              if (!snapshot.hasData || (snapshot.data?.loading ?? false)) {
                return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: const Center(child: CircularProgressIndicator()));
              }
              if (snapshot.data!.error) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  showMySnackBar(
                      context, snapshot.data?.errorMessage ?? "somethingWrong");
                });
              }
              User data = snapshot.data!.receivedProfile!;
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
                                      dashPattern: const [9, 7],
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
                      TextNavigator(
                        onTapFunction: () {
                          Provider.of<UserDetailProvider>(context,
                                  listen: false)
                              .changeUser(data);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const PersonalInfoPage()));
                        },
                        text: "personalInfo",
                      ),
                      TextNavigator(
                        onTapFunction: () {},
                        text: "privacyNSharing",
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
                      TextNavigator(
                        onTapFunction: () {},
                        text: "notification",
                      ),
                      TextNavigator(
                        onTapFunction: () {},
                        text: "purchaseHistory",
                      ),
                      TextNavigator(
                        onTapFunction: () {},
                        text: "appearance",
                      ),
                      TextNavigator(
                        onTapFunction: () {},
                        text: "review",
                      ),
                      TextNavigator(
                        onTapFunction: () {
                          context.read<UserDetailProvider>().user = null;
                          ResetPreferences.removeToken();
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => const SignInPage()),
                              (route) => false);
                        },
                        text: "logout",
                        style: const TextStyle(color: Colors.red),
                      ),
                    ]),
              );
            }));
  }
}
