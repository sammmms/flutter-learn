import 'package:travellingo/models/user.dart';

class UserState {
  final User? receivedProfile;
  final bool error;
  final bool loading;
  final String? errorMessage;
  final int? errorStatus;

  UserState({
    this.error = false,
    this.loading = false,
    this.errorMessage,
    this.errorStatus,
    this.receivedProfile,
  });
}