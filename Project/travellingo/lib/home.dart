import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:travellingo/profile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
            ? Text("Home")
            : _currentPage == 1
                ? Text("Transaction")
                : _currentPage == 2
                    ? Text("Favorite")
                    : _currentPage == 3
                        ? Profile()
                        : SizedBox(),
        bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.teal,
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
