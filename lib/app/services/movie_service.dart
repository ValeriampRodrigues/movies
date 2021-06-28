import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:movie/app/models/movie_model.dart';

String urlApi =
    'https://api.themoviedb.org/3/movie/500/recommendations?api_key=27175048bd966fd3705425f41782cd75&language=pt-BR&&page=';

class MovieService {
  Future<List<Results>> getMovie(int page) async {
    Uri url = Uri.parse(urlApi + page.toString());
    http.Response _response = await http.get(url);

    if (_response.statusCode == 200) {
      List<Results> body =
          MovieModel.fromJson(json.decode(_response.body)).results;
      return body;
    }
  }
}
