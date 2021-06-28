// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavoriteStore on _FavoriteStore, Store {
  final _$favoriteMoviesAtom = Atom(name: '_FavoriteStore.favoriteMovies');

  @override
  ObservableList<Results> get favoriteMovies {
    _$favoriteMoviesAtom.reportRead();
    return super.favoriteMovies;
  }

  @override
  set favoriteMovies(ObservableList<Results> value) {
    _$favoriteMoviesAtom.reportWrite(value, super.favoriteMovies, () {
      super.favoriteMovies = value;
    });
  }

  final _$fetchFavoriteAsyncAction =
      AsyncAction('_FavoriteStore.fetchFavorite');

  @override
  Future<bool> fetchFavorite() {
    return _$fetchFavoriteAsyncAction.run(() => super.fetchFavorite());
  }

  final _$favoriteMovieAsyncAction =
      AsyncAction('_FavoriteStore.favoriteMovie');

  @override
  Future favoriteMovie(Results movie) {
    return _$favoriteMovieAsyncAction.run(() => super.favoriteMovie(movie));
  }

  @override
  String toString() {
    return '''
favoriteMovies: ${favoriteMovies}
    ''';
  }
}
