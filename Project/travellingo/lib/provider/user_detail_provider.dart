import 'package:flutter/material.dart';
import 'package:Travellingo/models/user.dart';

class UserDetailProvider extends ChangeNotifier {
  User? user;

  UserDetailProvider({this.user});

  void changeUser(User newUser) {
    user = newUser;
    notifyListeners();
  }
}
