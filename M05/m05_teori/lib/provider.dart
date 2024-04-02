import 'package:flutter/material.dart';

class PriceProvider extends ChangeNotifier {
  double currentPrice;

  PriceProvider({required this.currentPrice});

  void addPrice(value) {
    currentPrice += value;
    notifyListeners();
  }

  void removePrice(value) {
    currentPrice -= value;
    notifyListeners();
  }
}
