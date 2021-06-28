// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovieStore on _MovieStore, Store {
  final _$moviesAtom = Atom(name: '_MovieStore.movies');

  @override
  ObservableList<Results> get movies {
    _$moviesAtom.reportRead();
    return super.movies;
  }

  @override
  set movies(ObservableList<Results> value) {
    _$moviesAtom.reportWrite(value, super.movies, () {
      super.movies = value;
    });
  }

  final _$movieSelectedAtom = Atom(name: '_MovieStore.movieSelected');

  @override
  ObservableList<Results> get movieSelected {
    _$movieSelectedAtom.reportRead();
    return super.movieSelected;
  }

  @override
  set movieSelected(ObservableList<Results> value) {
    _$movieSelectedAtom.reportWrite(value, super.movieSelected, () {
      super.movieSelected = value;
    });
  }

  final _$fetchMovieAsyncAction = AsyncAction('_MovieStore.fetchMovie');

  @override
  Future<bool> fetchMovie() {
    return _$fetchMovieAsyncAction.run(() => super.fetchMovie());
  }

  final _$_MovieStoreActionController = ActionController(name: '_MovieStore');

  @override
  dynamic addMovies(List<Results> r) {
    final _$actionInfo = _$_MovieStoreActionController.startAction(
        name: '_MovieStore.addMovies');
    try {
      return super.addMovies(r);
    } finally {
      _$_MovieStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic selectMovie(dynamic movie) {
    final _$actionInfo = _$_MovieStoreActionController.startAction(
        name: '_MovieStore.selectMovie');
    try {
      return super.selectMovie(movie);
    } finally {
      _$_MovieStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic favoriteMovie(Results movie) {
    final _$actionInfo = _$_MovieStoreActionController.startAction(
        name: '_MovieStore.favoriteMovie');
    try {
      return super.favoriteMovie(movie);
    } finally {
      _$_MovieStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic filterMovie(String text) {
    final _$actionInfo = _$_MovieStoreActionController.startAction(
        name: '_MovieStore.filterMovie');
    try {
      return super.filterMovie(text);
    } finally {
      _$_MovieStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
movies: ${movies},
movieSelected: ${movieSelected}
    ''';
  }
}
