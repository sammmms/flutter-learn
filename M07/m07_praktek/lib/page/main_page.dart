import 'package:flutter/material.dart';
import 'package:m02_praktek/models/post_model.dart';
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
  TextEditingController link = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  late List<Widget> listOfPage;

  @override
  void initState() {
    listOfPage = [
      const HomePage(),
      AddPostPage(link: link, title: title, description: description),
      const ProfileDetail(),
    ];
    super.initState();
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listOfPage[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          if (currentIndex == 1) {
            if (value != 1) {
              if (title.text != "" &&
                  description.text != "" &&
                  link.text != "") {
                Provider.of<UserProvider>(context, listen: false).addPost(
                    Post(
                        title: title.text,
                        description: description.text,
                        link: link.text),
                    Provider.of<CurrentUser>(context, listen: false).profile!);
              }
              title.text = "";
              description.text = "";
              link.text = "";
            }
          }
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          const BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          const BottomNavigationBarItem(
              label: "Add Post", icon: Icon(Icons.add)),
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
