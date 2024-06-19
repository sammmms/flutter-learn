import 'dart:async';

import 'package:flutter/material.dart';
import 'package:m02_praktek/models/post_model.dart';
import 'package:m02_praktek/models/user_model.dart';
import 'package:m02_praktek/utils/theme_utils.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  void undoAddPost(Post post, User profile) {
    var indexProfile = listProfile.indexOf(profile);
    if (indexProfile != -1) {
      listProfile[indexProfile].postList.remove(post);
      listProfile[indexProfile].post -= 1;
    }
    notifyListeners();
  }

  void changePost(User profile, {required Post post, required Post newPost}) {
    var indexProfile = listProfile.indexOf(profile);
    if (indexProfile != -1) {
      var indexPost = listProfile[indexProfile].postList.indexOf(post);
      if (indexPost != -1) {
        listProfile[indexProfile].postList[indexPost] = newPost;
      }
    }
    notifyListeners();
  }

  void schedulePost(User profile,
      {required Post post, required Post newPost, required Duration duration}) {
    var indexProfile = listProfile.indexOf(profile);
    if (indexProfile != -1) {
      Timer(duration, () {
        changePost(profile, post: post, newPost: newPost);
        notifyListeners();
      });
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

class DarkModeProvider extends ChangeNotifier {
  ThemeSelection theme;
  final BehaviorSubject<ThemeSelection> controller;

  DarkModeProvider(
      {this.theme = ThemeSelection.light, required this.controller});

  void changeTheme() async {
    final prefs = await SharedPreferences.getInstance();
    if (theme == ThemeSelection.dark) {
      theme = ThemeSelection.light;
    } else {
      theme = ThemeSelection.dark;
    }
    controller.add(theme);
    prefs.setString('theme', ThemeSelectionUtils().stringThemeOf(theme));
    notifyListeners();
  }

  void selectTheme(ThemeSelection selectedTheme) async {
    theme = selectedTheme;
    controller.add(theme);
    notifyListeners();
  }
}
