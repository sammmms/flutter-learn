import 'package:flutter/material.dart';

class User {
  String name;
  String gender;
  String email;
  String phone;
  String birthday;
  String password;
  String id;
  String url;

  User(
      {required this.name,
      required this.email,
      required this.phone,
      required this.birthday,
      required this.password,
      this.id = "",
      this.url = "",
      this.gender = ""});
}

var user1 = User(
  name: "Samuel Onasis",
  email: "221110680@students.mikroskil.ac.id",
  phone: "+62082168285077",
  birthday: "23-07-2004",
  password: "123"
);

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
