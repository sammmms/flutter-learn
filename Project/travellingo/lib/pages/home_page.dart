import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:travellingo/pages/profile/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    final Map<String, Widget> navigationItem = {
      "Home": const Icon(Icons.home_outlined),
      "Transaction": const Icon(Icons.confirmation_num_outlined),
      "Favorite": const Icon(Icons.bookmark_added_outlined),
      "Profile": const Icon(Icons.person_outline)
    };
    return Scaffold(
        body: _currentPage == 0
            ? const Text("Home")
            : _currentPage == 1
                ? const Text("Transaction")
                : _currentPage == 2
                    ? const Text("Favorite")
                    : _currentPage == 3
                        ? const ProfilePage()
                        : const SizedBox(),
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
            items: navigationItem.keys.map((e) {
              return BottomNavigationBarItem(
                  label: e.toLowerCase().getString(context),
                  icon: navigationItem[e]!);
            }).toList()));
  }
}
