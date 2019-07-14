import 'dart:async';
import 'package:async/async.dart';
import 'package:flutter_redux_app/Redux/AuthenticationRdx/AuthActions.dart';
import 'package:flutter_redux_app/Redux/AuthenticationRdx/AuthMiddleware.dart';
import 'package:flutter_redux_app/Redux/MovieRdx/MovieActions.dart';
import 'package:flutter_redux_app/Resources/Api/Api.dart';
import 'package:flutter_redux_app/Utils/Logger.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux_app/Redux/AppRdx.dart';

class ResourceMiddleware implements MiddlewareClass<AppState> {
  ResourceMiddleware({this.api});
  final Api api;

  CancelableOperation<Store<AppState>> _operation;

  @override
  void call(Store<AppState> store, action, NextDispatcher next) {
    if (action is AuthAction) {
      Logger().log("Auth action intercepted");
      AuthMiddleware(store: store, action: action, api: api).call();
    }
    if (action is MovieAction) {
      Logger().log("Movie action intercepted");
      var movieMiddleware = MovieMiddleware();
    }
    next(action);
  }
}

class MovieMiddleware {}
