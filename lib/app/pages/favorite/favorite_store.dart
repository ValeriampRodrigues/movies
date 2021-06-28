import 'package:mobx/mobx.dart';
import 'package:movie/app/models/movie_model.dart';
import 'package:movie/app/share_preferences/favoritos_preferences.dart';
part 'favorite_store.g.dart';

class FavoriteStore = _FavoriteStore with _$FavoriteStore;

abstract class _FavoriteStore with Store {
  @observable
  var favoriteMovies = new ObservableList<Results>();

  //Busca na API
  @action
  Future<bool> fetchFavorite() async {
    if (await FavoritePreferences().getFavoriteMovie() != "")
      favoriteMovies.clear();
    favoriteMovies.addAll(await FavoritePreferences().getFavoriteMovie());
    return true;
  }

  @action
  favoriteMovie(Results movie) async {
    await new FavoritePreferences().putFavoriteMovie(movie);
    fetchFavorite();
  }
}
