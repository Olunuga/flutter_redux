import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_redux_app/Redux/AppRdx.dart';
import 'package:flutter_redux_app/Redux/AuthenticationRdx/AuthActions.dart';
import 'package:flutter_redux_app/Resources/Api/AuthApi.dart';
import 'package:redux/redux.dart';

class AuthMiddleware {
  Store<AppState> store;
  AuthAction action;
  AuthApi authApi;
  AuthMiddleware({this.store, this.action, @required this.authApi});

  call() {
    if (action is LoginAction) {
      print("handling login action");

      store.dispatch(LoginLoadingAction(condition: true));
      new Timer(new Duration(milliseconds: 2000), () {
        LoginAction loginAction = action as LoginAction;
        authApi.login(loginAction.data).then((response) {
          print("Login passed with success message: ${response.data}");
          //Todo save login data to appState if temp login/ userDefaults if
          // always login.
          store.dispatch(LoginLoadingAction(condition: false));
          store.dispatch(LoginSuccessfulAction(response: response));
        }).catchError((error) {
          print("Login api should fail api ha ha ha! with error: $error");
          store.dispatch(LoginLoadingAction(condition: false));
          store.dispatch(LoginFailedAction(response: error));
        });
      });
    }
    if (action is LogoutAction) {
      //Clear local data.
    }
  }
}
