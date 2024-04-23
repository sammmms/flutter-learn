import 'package:flutter/material.dart';
import 'package:m02_praktek/page/add_post_page.dart';
import 'package:m02_praktek/page/home_page.dart';
import 'package:m02_praktek/page/profile_page.dart';
import 'package:m02_praktek/providers/provider.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> listOfPage = [
    HomePage(),
    AddPostPage(),
    ProfileDetail(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listOfPage[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "Add Post", icon: Icon(Icons.add)),
          BottomNavigationBarItem(
              label: "Profile",
              icon: CircleAvatar(
                foregroundImage: AssetImage(
                    "assets/${Provider.of<CurrentUser>(context).profile?.pictureLink ?? ""}"),
              ))
        ],
      ),
    );
  }
}
