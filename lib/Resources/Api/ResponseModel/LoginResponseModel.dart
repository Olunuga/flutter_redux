class LoginResponseModel {
  final String message;
  final String token;
  final String email;
  final String username;
  LoginResponseModel({this.token, this.username, this.email, this.message});

  factory LoginResponseModel.fromJSON(Map<String, dynamic> data) =>
      LoginResponseModel(
          token: data["token"],
          email: data["email"],
          username: data["username"]);
}
