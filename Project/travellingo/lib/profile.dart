import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travellingo/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<CurrentUser>(context).user;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile", style: TextStyle(fontWeight: FontWeight.bold),)
      ),
      body: Column(
        children:[
          InkWell(
            onTap: (){},
            child: CircleAvatar(
              backgroundImage: user.url == "" ? user.url : null,
            ),
          ),
          Text(user.name, style: const TextStyle(fontWeight: FontWeight.bold), textScaler: const TextScaler.linear(1.1),),
          Text(user.email)
        ]
      )
    );
  }
}