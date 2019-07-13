import 'package:flutter_redux_app/Redux/AppRdx.dart';
import 'package:flutter_redux_app/Redux/MovieRdx/MovieActions.dart';
import 'package:flutter_redux_app/Redux/MovieRdx/MovieState.dart';
import 'package:redux/redux.dart';

Reducer<MovieState> movieReducer = combineReducers<MovieState>([
  new TypedReducer<MovieState, FetchMovieAction>(fetchMovieReducer),
  new TypedReducer<MovieState, FetchMovieLoading>(fetchMovieLoadingReducer),
]);

//Individual reducers;
MovieState fetchMovieReducer(MovieState movieState, FetchMovieAction action) {
  return MovieState.authenticated();
}

MovieState fetchMovieLoadingReducer(
    MovieState movieState, FetchMovieLoading action) {
  return MovieState.initial();
}
