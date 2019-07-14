import 'package:flutter_redux_app/Resources/Api/RequestModel/RequestModel.dart';

class LoginRequestModel implements RequestModel {
  LoginRequestModel({this.password, this.username});
  final String password;
  final String username;

  @override
  Map<String, dynamic> toMap() {
    // TODO: implement toMap
    return {"userName": "$username", "password": "$password"};
  }

  @override
  String toString() {
    return "Password: $password \nUsername: $username";
  }
}
