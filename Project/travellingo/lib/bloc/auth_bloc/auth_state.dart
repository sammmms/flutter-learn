class AuthState {
  String? receivedToken;
  bool isSubmitting;

  AuthState({this.receivedToken, this.isSubmitting = false});
}
