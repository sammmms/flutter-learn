import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travellingo/pages/home/widget/home_recommendation.dart';

class HomeAllNearby extends StatefulWidget {
  const HomeAllNearby({super.key});

  @override
  State<HomeAllNearby> createState() => _HomeAllNearbyState();
}

class _HomeAllNearbyState extends State<HomeAllNearby> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                HomeRecommendation(),
                HomeRecommendation(),
                HomeRecommendation(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}