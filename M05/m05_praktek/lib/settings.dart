import 'package:flutter/material.dart';
import 'package:m02_praktek/login.dart';
import 'package:m02_praktek/provider.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var currentPrivacy = Provider.of<CurrentUser>(context, listen: false)
        .profile
        .userSetting["privacy"];
    var currentNotification = Provider.of<CurrentUser>(context, listen: false)
        .profile
        .userSetting["notifications"];
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              "Privacy",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const SizedBox(
              height: 5,
            ),
            RadioListTile(
                title: const Text("Public"),
                subtitle: const Text("Everyone can see your posts."),
                value: currentPrivacy,
                groupValue: "public",
                onChanged: (value) {
                  setState(() {
                    Provider.of<UserProvider>(context, listen: false)
                        .changeSetting("privacy", "public", profile);
                    currentPrivacy = "public";
                  });
                }),
            RadioListTile(
                title: const Text("Followers Only"),
                subtitle: const Text("Only your followers can see your posts."),
                value: currentPrivacy,
                groupValue: "followers",
                onChanged: (value) {
                  setState(() {
                    Provider.of<UserProvider>(context, listen: false)
                        .changeSetting("privacy", "followers", profile);
                    currentPrivacy = "followers";
                  });
                }),
            RadioListTile(
                title: const Text("Private"),
                subtitle: const Text("Only certain people can see your posts."),
                value: currentPrivacy,
                groupValue: "private",
                onChanged: (value) {
                  setState(() {
                    Provider.of<UserProvider>(context, listen: false)
                        .changeSetting("privacy", "private", profile);
                    currentPrivacy = "private";
                  });
                }),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Notification",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const SizedBox(
              height: 5,
            ),
            RadioListTile(
                title: const Text("All"),
                subtitle: const Text(
                    "Receive notification for all activities, including new followers, likes and comments."),
                value: currentNotification,
                groupValue: "all",
                onChanged: (value) {
                  setState(() {
                    Provider.of<UserProvider>(context, listen: false)
                        .changeSetting("notifications", "all", profile);
                    currentNotification = "all";
                  });
                }),
            RadioListTile(
                title: const Text("Important"),
                subtitle: const Text(
                    "Get notified only for important interactions, such as direct messages and mentions."),
                value: currentNotification,
                groupValue: "important",
                onChanged: (value) {
                  setState(() {
                    Provider.of<UserProvider>(context, listen: false)
                        .changeSetting("notifications", "important", profile);
                    currentNotification = "important";
                  });
                }),
            RadioListTile(
                title: const Text("None"),
                subtitle: const Text(
                    "You won't be disturbed by any notifications from the app."),
                value: currentNotification,
                groupValue: "none",
                onChanged: (value) {
                  setState(() {
                    Provider.of<UserProvider>(context, listen: false)
                        .changeSetting("notifications", "none", profile);
                    currentNotification = "none";
                  });
                }),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.redAccent)),
                  onPressed: () {
                    Provider.of<CurrentUser>(context, listen: false)
                        .logoutUser();
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const Login()));
                  },
                  child: const Text(
                    "Logout",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
            )
          ]),
        ));
  }
}
