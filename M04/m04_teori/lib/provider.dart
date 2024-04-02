import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier{
  String username;

  UserProvider({this.username = ""});

  void changeName(usname){
    username = usname;
    notifyListeners();
  }
}
