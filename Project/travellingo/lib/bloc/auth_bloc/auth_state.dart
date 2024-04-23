class AuthState {
  String? receivedToken;
  bool isSubmitting;
  bool error;
  String? errorMessage;
  int? errorStatus;

  AuthState({
    this.receivedToken,
    this.errorMessage,
    this.errorStatus,
    this.isSubmitting = false,
    this.error = false,
  });
}
