import 'package:flutter_redux_app/Resources/Api/AuthApi.dart';
import 'package:flutter_redux_app/Resources/Api/MovieApi.dart';

class ApiManager {
  final AuthApi authApi;
  final MovieApi movieApi;
  ApiManager(this.authApi, this.movieApi);
}
