import 'package:flutter/material.dart';
import 'package:travellingo/pages/home%20(aswin)/home_page.dart';
import 'package:travellingo/pages/profile%20(samuel)/profile_page.dart';
import 'package:travellingo/pages/transportation%20(giovanny)/basket/basket_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentPage = 0;
  late List<Map<String, dynamic>> navigationItem;
  @override
  void initState() {
    navigationItem = [
      {
        "title": "Home",
        "icon": const Icon(Icons.home_outlined),
        "page": const HomePage()
      },
      {
        "title": "Transaction",
        "icon": const Icon(Icons.confirmation_num_outlined),
        "page": const BasketPage()
      },
      {
        "title": "Favorite",
        "icon": const Icon(Icons.bookmark_added_outlined),
        "page": const Text("Favorite")
      },
      {
        "title": "Profile",
        "icon": const Icon(Icons.person_outline),
        "page": const ProfilePage()
      }
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: navigationItem[_currentPage]["page"],
        bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.grey,
            // selectedItemColor: Colors.teal,
            showUnselectedLabels: true,
            currentIndex: _currentPage,
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              setState(() {
                _currentPage = value;
              });
            },
            items: navigationItem
                .map((entry) => BottomNavigationBarItem(
                    label: entry["title"], icon: entry["icon"]))
                .toList()));
  }
}
