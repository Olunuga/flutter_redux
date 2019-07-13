import 'package:flutter_redux_app/Redux/AppRdx.dart';

abstract class MovieAction extends AppAction {}

class FetchMovieAction extends MovieAction {
  final Map param;
  FetchMovieAction({this.param});
}

class FetchMovieLoading extends MovieAction {}
