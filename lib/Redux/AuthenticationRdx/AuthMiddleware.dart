import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_redux_app/Redux/AppRdx.dart';
import 'package:flutter_redux_app/Config/networkConfig.dart';
import 'package:flutter_redux_app/Redux/AuthenticationRdx/AuthActions.dart';
import 'package:flutter_redux_app/Resources/Api/Api.dart';
import 'package:flutter_redux_app/Resources/Api/RequestModel/LoginRequestModel.dart';
import 'package:flutter_redux_app/Resources/Api/ResponseModel/LoginResponseModel.dart';
import 'package:flutter_redux_app/Utils/Logger.dart';
import 'package:redux/redux.dart';

class AuthMiddleware {
  Store<AppState> store;
  AuthAction action;
  Api api;
  AuthMiddleware({this.store, this.action, @required this.api});

  call() {
    if (action is LoginAction) {
      Logger().log("Login action intercepted");

      store.dispatch(LoginLoadingAction(condition: true));
      LoginAction loginAction = action as LoginAction;
      LoginRequestModel requestModel = loginAction.data;

      Logger().log("Login parameter", value: requestModel.toString());
      Logger().log("Login url", value: LOGIN);

      api.post(url: LOGIN, data: requestModel.toMap()).then((response) {
        if (response.isSuccess()) {
          Logger().log("Login success data", value: response.data);
          LoginResponseModel loginResponse =
              LoginResponseModel.fromJSON(response.data);
          store.dispatch(LoginLoadingAction(condition: false));
          store.dispatch(LoginSuccessfulAction(response: loginResponse));

          //todo : also save data to local db here to persist login;

        } else {
          Logger().log("Login failure message", value: response.message);
          store.dispatch(LoginLoadingAction(condition: false));
          store.dispatch(LoginFailedAction(message: response.message));
        }
      }).catchError((error) {
        //Mostly internet errors
        Logger().log("Login error", value: error);
        store.dispatch(LoginLoadingAction(condition: false));
        store.dispatch(LoginFailedAction(message: error.toString()));
      });
    }
    if (action is LogoutAction) {
      //Clear local data.
    }
  }
}
