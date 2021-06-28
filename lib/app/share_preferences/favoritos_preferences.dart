import 'dart:convert';
import 'package:movie/app/models/movie_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences _prefs;

class FavoritePreferences {
  putFavoriteMovie(Results movie) async {
    List<Results> _favotireMovie = await getFavoriteMovie();
    var matchingvalues = _favotireMovie.where((i) => i.id == movie.id);
    if (matchingvalues.length == 0) {
      _favotireMovie.add(movie);
      String jsonUser = jsonEncode(_favotireMovie);
      await _prefs.setString('favoriteMovie', jsonUser);
    } else {
      var matchingvalues =
          _favotireMovie.where((i) => i.id != movie.id).toList();
      String jsonUser = "";
      if (matchingvalues.length > 0) jsonUser = jsonEncode(matchingvalues);
      await _prefs.setString('favoriteMovie', jsonUser);
    }
  }

  getFavoriteMovie() async {
    _prefs = await SharedPreferences.getInstance();

    var favoriteList = _prefs.getString('favoriteMovie') == null
        ? ""
        : _prefs.getString('favoriteMovie');
    if (favoriteList == "") {
      return List<Results>();
    } else {
      List jsonResponse = json.decode(favoriteList);
      return jsonResponse.map((job) => new Results.fromJson(job)).toList();
    }
  }
}
