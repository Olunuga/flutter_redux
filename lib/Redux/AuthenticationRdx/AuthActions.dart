import 'package:flutter_redux_app/Redux/AppRdx.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_redux_app/Resources/Api/RequestModel'
    '/LoginRequestModel.dart';
import 'package:flutter_redux_app/Resources/Api/ResponseModel/LoginResponseModel.dart';
import 'package:flutter_redux_app/Resources/Api/ResponseModel/ResponseModel.dart';

abstract class AuthAction extends AppAction {}

///*********   Login ****************
class LoginAction extends AuthAction {
  final LoginRequestModel data;
  LoginAction({@required this.data});
}

class LoginSuccessfulAction extends AuthAction {
  final LoginResponseModel response;
  LoginSuccessfulAction({@required this.response});
}

class LoginFailedAction extends AuthAction {
  final String message;
  LoginFailedAction({@required this.message});
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
