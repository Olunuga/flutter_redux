import 'package:flutter_redux_app/Redux/AuthenticationRdx/AuthActions.dart';
import 'package:flutter_redux_app/Redux/AuthenticationRdx/AuthReducers.dart';
import 'package:flutter_redux_app/Redux/AuthenticationRdx/AuthState.dart';
import 'package:flutter_redux_app/Redux/CounterRdx/CounterState.dart';
import 'package:flutter_redux_app/Redux/CounterRdx/CounterReducer.dart';
import 'package:flutter_redux_app/Redux/MovieRdx/MovieReducer.dart';
import 'package:flutter_redux_app/Redux/MovieRdx/MovieState.dart';

class AppState {
  //Auth
  final AuthState authState;
  //movie
  final MovieState movieState;

  //counter basic test to see it work;
  final CounterState counterState;

  AppState(this.authState, this.movieState, this.counterState);
  factory AppState.initial() => AppState(
      AuthState.initial(), MovieState.initial(), CounterState.initial());
}

abstract class AppAction {
  String toString() {
    return '$runtimeType';
  }
}

AppState appReducer(dynamic state, dynamic action) {
  return new AppState(
      //Auth reducers, most apps have auth, so this is supposed to be generic
      authReducer(state.authState, action), //Auth

      //other reducers comes in here.

      //movies
      movieReducer(state.movieState, action),

      //counter
      counterReducer(state.counterState, action));
}
