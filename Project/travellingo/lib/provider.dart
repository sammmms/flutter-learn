import 'package:flutter/material.dart';

class User {
  String name;
  String gender;
  String email;
  String phone;
  String birthday;
  String id;
  String url;

  User(
      {required this.name,
      required this.email,
      required this.phone,
      required this.birthday,
      this.id = "",
      this.url = "",
      this.gender = ""});
}

class UserProvider extends ChangeNotifier {
  List<User> listUser;

  UserProvider({required this.listUser});

  void addUser(User newUser) {
    listUser.add(newUser);
    notifyListeners();
  }
}

class CurrentUser extends ChangeNotifier {
  var user;

  CurrentUser({this.user});

  void changeUser(User newUser) {
    user = newUser;
    notifyListeners();
  }
}
