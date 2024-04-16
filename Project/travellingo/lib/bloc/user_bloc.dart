import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:Travellingo/models/user.dart';

class UserBloc {
  StreamController<User> controller = StreamController();
  final dio = Dio();

  Future getUser(String token, BuildContext context) async {
    try {
      var response = await dio.get(
          "https://travellingo-backend.netlify.app/api/profile",
          options: Options(headers: {"Authorization": "Bearer $token"}));
      var data = response.data;
      controller.add(User.fromJson(data));
    } catch (err) {
      controller.addError("");
    }
  }
}
