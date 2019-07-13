class MovieState {
  final bool hasError; //todo: create an error class;
  final bool isLoading;
  final List<Map> movieList;
  final dynamic result; //todo create a result class;

  MovieState(
      {this.hasError = false,
      this.isLoading = false,
      this.movieList,
      this.result = 0});

  factory MovieState.initial() => MovieState(isLoading: true, hasError: false);
  factory MovieState.loading() => MovieState(isLoading: true);
  factory MovieState.error() => MovieState(hasError: true);
  factory MovieState.authenticated() => MovieState(movieList: []);
}
