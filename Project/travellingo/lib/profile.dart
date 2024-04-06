import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';
import 'package:travellingo/provider.dart';
import 'package:travellingo/signin.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<CurrentUser>(context).user!;
    return Scaffold(
        appBar: AppBar(
            title: Text(
          "profile".getString(context),
          style: const TextStyle(fontWeight: FontWeight.bold),
        )),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(90),
                  child: Badge(
                    alignment: Alignment.bottomRight,
                    smallSize: 30,
                    backgroundColor: Colors.yellow,
                    label: const Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                    largeSize: 30,
                    child: CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            user.url != "" ? NetworkImage(user.url) : null,
                        backgroundColor: const Color(0xFFF6F8FB)),
                  ),
                ),
                Text(
                  user.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  textScaler: const TextScaler.linear(1.1),
                ),
                Text(user.email)
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
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("personalInfo".getString(context)),
                const Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("notification".getString(context)),
                const Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("purchaseHistory".getString(context)),
                const Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("appearance".getString(context)),
                const Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("review".getString(context)),
                const Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              context.read<CurrentUser>().user = null;
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const SignIn()),
                  (route) => false);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("logout".getString(context),
                      style: const TextStyle(color: Colors.redAccent)),
                ],
              ),
            ),
          ),
        ]));
  }
}
