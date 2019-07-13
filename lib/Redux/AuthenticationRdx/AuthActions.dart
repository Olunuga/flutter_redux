import 'package:flutter_redux_app/Redux/AppRdx.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_redux_app/Resources/Api/Response.dart';

abstract class AuthAction extends AppAction {}

///*********   Login ****************
class LoginAction extends AuthAction {
  final Map data;
  LoginAction({@required this.data});
}

class LoginSuccessfulAction extends AuthAction {
  final Response response;
  LoginSuccessfulAction({@required this.response});
}

class LoginFailedAction extends AuthAction {
  final Response response;
  LoginFailedAction({@required this.response});
}

class LoginLoadingAction extends AuthAction {
  final bool condition;
  LoginLoadingAction({this.condition});
}
//*********  End  ****************//

///********** Logout ****************
class LogoutAction extends AuthAction {}

class RegisterAction extends AuthAction {
  final Map data;
  RegisterAction({@required this.data});
}
//*********  End  ****************//

///********* Register Action ****************

//********* end ****************//
