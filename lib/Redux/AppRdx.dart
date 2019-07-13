import 'package:flutter_redux_app/Redux/AuthenticationRdx/AuthActions.dart';
import 'package:flutter_redux_app/Redux/AuthenticationRdx/AuthReducers.dart';
import 'package:flutter_redux_app/Redux/AuthenticationRdx/AuthState.dart';
import 'package:flutter_redux_app/Redux/CounterRdx/CounterState.dart';
import 'package:flutter_redux_app/Redux/CounterRdx/CounterReducer.dart';
import 'package:flutter_redux_app/Redux/MovieRdx/MovieReducer.dart';
import 'package:flutter_redux_app/Redux/MovieRdx/MovieState.dart';

//State
class AppState {
  final AuthState authState;
  final MovieState movieState;
  final CounterState counterState;

  AppState(this.authState, this.movieState, this.counterState);
  factory AppState.initial() => AppState(
      AuthState.initial(), MovieState.initial(), CounterState.initial());
}

//Action
abstract class AppAction {
  String toString() {
    return '$runtimeType';
  }
}

//Reducer
AppState appReducer(dynamic state, dynamic action) {
  return new AppState(
      //Auth reducers, most apps have auth, so this is supposed to be generic
      authReducer(state.authState, action), //Auth

      //other reducers comes in here.
      movieReducer(state.movieState, action),
      counterReducer(state.counterState, action));
}
