import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:Travellingo/bloc/auth_bloc/auth_state.dart';
import 'package:Travellingo/component/snackbar_component.dart';
import 'package:Travellingo/bloc/preferences/save_preferences.dart';

class AuthBloc {
  final StreamController<AuthState> controller = StreamController();
  final dio = Dio();

  Future signIn(BuildContext context, String email, String password) async {
    try {
      controller.add(AuthState(isSubmitting: true));
      var response = await dio.post(
          "https://travellingo-backend.netlify.app/api/login",
          data: {"email": email, "password": password});
      var token = response.data["token"];
      controller.add(AuthState(receivedToken: token));
      SavePreferences.saveToken(token);
      return true;
    } on DioException catch (err) {
      if (!context.mounted) return;
      showMySnackBar(context, err.response.toString().getString(context));
      controller.add(AuthState());
    } catch (err) {
      if (!context.mounted) return;
      showMySnackBar(context, "somethingWrong".getString(context));
      controller.add(AuthState());
    }
  }

  Future signUp(BuildContext context, String name, String email,
      String password, String birthday, String phoneNumber) async {
    try {
      controller.add(AuthState(isSubmitting: true));
      var response = await dio
          .post("https://travellingo-backend.netlify.app/api/register", data: {
        "name": name,
        "email": email,
        "password": password,
        "birthday": birthday,
        "phoneNumber": phoneNumber
      });
      if (response.statusCode == 201) {
        controller.add(AuthState());
      }
      return true;
    } on DioException catch (err) {
      if (!context.mounted) return;
      showMySnackBar(context, err.response.toString().getString(context));
      controller.add(AuthState());
    } catch (err) {
      if (!context.mounted) return;
      if (!context.mounted) return;
      showMySnackBar(context, "somethingWrong".getString(context));
      controller.add(AuthState());
    }
  }
}
