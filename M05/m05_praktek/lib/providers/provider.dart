import 'package:flutter/material.dart';
import 'package:m02_praktek/models/post_model.dart';
import 'package:m02_praktek/models/user_model.dart';

class UserProvider extends ChangeNotifier {
  List<User> listProfile;

  UserProvider({required this.listProfile});

  void addUser(User profile) {
    listProfile.add(profile);
    notifyListeners();
  }

  void addPost(Post post, User profile) {
    var indexProfile = listProfile.indexOf(profile);
    if (indexProfile != -1) {
      listProfile[indexProfile].postList.add(post);
      listProfile[indexProfile].post += 1;
    }
    notifyListeners();
  }

  void changeSetting(String code, String choice, User profile) {
    var indexProfile = listProfile.indexOf(profile);
    if (indexProfile != -1) {
      listProfile[indexProfile].userSetting[code] = choice;
    }
    notifyListeners();
  }
}

class CurrentUser extends ChangeNotifier {
  User? profile;

  CurrentUser({this.profile});

  void changeUser(User newProfile) {
    profile = newProfile;
    notifyListeners();
  }

  void logoutUser() {
    profile = null;
    notifyListeners();
  }
}
