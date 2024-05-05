import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:travellingo/pages/transaction/basket.dart';
import 'package:travellingo/pages/transaction/flight_page.dart';
import 'package:travellingo/pages/profile/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;
  final List<Widget> pages = [
    const FlightPage(),
    const BasketPage(),
    const Text("Favorite Page"),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    final Map<String, Widget> navigationItem = {
      "Home": const Icon(Icons.home_outlined),
      "Transaction": const Icon(Icons.confirmation_num_outlined),
      "Favorite": const Icon(Icons.bookmark_added_outlined),
      "Profile": const Icon(Icons.person_outline)
    };

    return Scaffold(
        body: pages[_currentPage],
        bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.grey,
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
