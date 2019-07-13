import 'dart:async';
import 'package:async/async.dart';
import 'package:flutter_redux_app/Redux/AuthenticationRdx/AuthActions.dart';
import 'package:flutter_redux_app/Redux/AuthenticationRdx/AuthMiddleware.dart';
import 'package:flutter_redux_app/Redux/MovieRdx/MovieActions.dart';
import 'package:flutter_redux_app/Resources/Api/ApiManager.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux_app/Redux/AppRdx.dart';

class ResourceMiddleware implements MiddlewareClass<AppState> {
  ResourceMiddleware({this.apiManager});
  final ApiManager apiManager;

  CancelableOperation<Store<AppState>> _operation;

  @override
  void call(Store<AppState> store, action, NextDispatcher next) {
    // TODO: implement call

    print("Middleware call");
    if (action is AuthAction) {
      print("Auth action intercepted call");
      AuthMiddleware(store: store, action: action, authApi: apiManager.authApi)
          .call();
    }
    if (action is MovieAction) {
      var movieMiddleware = MovieMiddleware();
    }
    next(action);
  }
}

class MovieMiddleware {}
