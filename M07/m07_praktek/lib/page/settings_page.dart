import 'package:flutter/material.dart';
import 'package:m02_praktek/component/dark_mode_switch.dart';
import 'package:m02_praktek/data/data_dummy.dart';
import 'package:m02_praktek/page/login_page.dart';
import 'package:m02_praktek/providers/provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    var currentPrivacy =
        context.read<CurrentUser>().profile!.userSetting["privacy"];
    var currentNotification =
        context.read<CurrentUser>().profile!.userSetting["notifications"];
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
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
                  subtitle:
                      const Text("Only your followers can see your posts."),
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
                  subtitle:
                      const Text("Only certain people can see your posts."),
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
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Preferences",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              const SizedBox(
                height: 5,
              ),
              const DarkModeSwitch(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.redAccent)),
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                          (route) => false);
                      Provider.of<CurrentUser>(context, listen: false)
                          .logoutUser();
                    },
                    child: const Text(
                      "Logout",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
              ),
            ]),
          ),
        ));
  }
}
