import 'package:flutter_redux_app/Redux/AppRdx.dart';
import 'package:flutter/foundation.dart';

abstract class AuthAction extends AppAction {}

class LoginAction extends AuthAction {
  final Map data;
  LoginAction({@required this.data});
}

class LogoutAction extends AuthAction {}

class RegisterAction extends AuthAction {
  final Map data;
  RegisterAction({@required this.data});
}
