import 'dart:math';

import 'package:mobx/mobx.dart';
import 'package:movie/app/models/movie_model.dart';
import 'package:movie/app/services/movie_service.dart';
import 'package:movie/app/share_preferences/favoritos_preferences.dart';
part 'movie_list_store.g.dart';

class MovieStore = _MovieStore with _$MovieStore;

abstract class _MovieStore with Store {
  @observable
  var movies = new ObservableList<Results>();
  var moviesApi = <Results>[];

  //Busca na API
  @action
  Future<bool> fetchMovie() async {
    if (movies.length == 0) {
      int page = 1;
      var moviesService;

      //Carrega toda lista de filmes para trabalhar em memoria
      while (page == 1 || moviesService.length > 0) {
        moviesService = await serviceMovie(page);
        for (var item in moviesService) {
          this.moviesApi.add(item);
        }
        page++;
      }
      var index = indexRandon();
      addMovies(this.moviesApi.sublist(index, index + 10));
      selectMovie(this.moviesApi[index]);
    }
    return true;
  }

  Future<List<Results>> serviceMovie(page) async {
    var element = await MovieService().getMovie(page);
    return element;
  }

//Adicionar itens na tela
  @action
  addMovies(List<Results> r) {
    this.movies.clear();
    this.movies.addAll(r);
  }

//Filme Selecionado
  @observable
  var movieSelected = ObservableList<Results>();
  @action
  selectMovie(movie) {
    movieSelected.clear();
    movieSelected.add(movie);
  }

  @action
  favoriteMovie(Results movie) {
    new FavoritePreferences().putFavoriteMovie(movie);
  }

  @action
  filterMovie(String text) {
    var moviesFilter = moviesApi.where((i) {
      var n = i.title.replaceAll(new RegExp(r'[^\w\s]+'), '').trim();
      var t = text.replaceAll(new RegExp(r'[^\w\s]+'), '').trim();
      return n.toLowerCase().contains(t.toLowerCase());
    }).toList();
    addMovies(moviesFilter);
  }

  indexRandon() {
    var rng = new Random();
    return rng.nextInt(max(0, this.moviesApi.length - 10));
  }
}
