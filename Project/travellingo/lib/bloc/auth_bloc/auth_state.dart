import 'package:travellingo/bloc/user_bloc.dart';

class AuthState {
  String? receivedToken;
  bool isSubmitting;

  AuthState({this.receivedToken, this.isSubmitting = false});
}
