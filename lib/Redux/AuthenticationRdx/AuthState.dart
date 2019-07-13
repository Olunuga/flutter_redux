class AuthState {
  final bool hasError; //todo: create an error class;
  final bool isLoading;
  final bool loginLoading;
  final bool authenticated;
  final dynamic result; //todo create a result class;

  AuthState(
      {this.hasError = false,
      this.isLoading = false,
      this.authenticated = false,
      this.loginLoading = false,
      this.result = 0});

  factory AuthState.initial() => AuthState(authenticated: false);
  factory AuthState.loading() => AuthState(isLoading: true);
  factory AuthState.error() => AuthState(hasError: true);
  factory AuthState.authenticated() => AuthState(authenticated: true);
  factory AuthState.loginLoading(bool condition) =>
      AuthState(loginLoading: condition);
}
