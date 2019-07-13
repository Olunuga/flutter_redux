import 'package:flutter_redux_app/Redux/AuthenticationRdx/AuthActions.dart';
import 'package:flutter_redux_app/Redux/AuthenticationRdx/AuthState.dart';
import 'package:redux/redux.dart';

Reducer<AuthState> authReducer = combineReducers<AuthState>([
  //new TypedReducer<AuthState, LoginAction>(loginReducer), //Todo: this is
  // being handled by the middleware;
  new TypedReducer<AuthState, LoginLoadingAction>(loginLoadingReducer),
  new TypedReducer<AuthState, LogoutAction>(logoutReducer),
  new TypedReducer<AuthState, RegisterAction>(registerReducer),
]);

//Reducers
AuthState loginReducer(AuthState appState, LoginAction action) {
  return AuthState.authenticated();
}

AuthState loginLoadingReducer(AuthState appState, LoginLoadingAction action) {
  return AuthState.loginLoading(action.condition);
}

AuthState logoutReducer(AuthState appState, LogoutAction action) {
  return AuthState.initial();
}

AuthState registerReducer(AuthState appState, RegisterAction action) {
  return AuthState.initial();
}
