import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movie/app/models/movie_model.dart';
import 'package:movie/app/pages/movielist/movie_list_store.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

final movieStore = MovieStore();

class _MovieListState extends State<MovieList> {
  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(
        child: Column(children: [
      SizedBox(
        height: 16,
      ),
      _search(),
      Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          height: MediaQuery.of(context).size.height * 0.43,
          child: FutureBuilder<bool>(
              future: movieStore.fetchMovie(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                      child: Text("Opsss... Erro ao carregar lista!"));
                } else if (snapshot.hasData) {
                  return Observer(
                      builder: (_) => ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: movieStore.movies.length,
                            itemBuilder: (context, index) {
                              return _getMovie(
                                  context, movieStore.movies[index]);
                            },
                          ));
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              })),
      _getMovieSelect(context)
    ]));
  }
}

//montaCards de filmes

_getMovie(BuildContext context, Results movie) {
  return new GestureDetector(
      onTap: () {
        movieStore.selectMovie(movie);
      }, // handle your image tap here
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        child: Card(
          color: Colors.transparent,
          child: Container(
              child: Image.network(
            "https://www.themoviedb.org/t/p/w220_and_h330_face/" +
                movie.posterPath,
          )),
        ),
      ));
}

//Monta area filme selecionado
_getMovieSelect(BuildContext context) {
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
          decoration: new BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(10.0),
                topRight: const Radius.circular(10.0),
              )),
          alignment: Alignment.topCenter,
          child: Observer(
              builder: (_) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                        // Icon(                                        // adicione daqui
                        //jaFoiSalva ? Icons.favorite : Icons.favorite_border,
                        //  color: jaFoiSalva ? Colors.red : null,
                        //)
                        Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                            ),
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  // adicione daqui
                                  icon: const Icon(Icons.favorite_rounded),
                                  color: Theme.of(context).primaryColor,
                                  onPressed: () {
                                    showAlertDialog(context,
                                        movieStore.movieSelected.first);
                                  },
                                ))),

                        SizedBox(
                          height: 16,
                        ),
                        Center(
                            child: Container(
                                alignment: Alignment.topCenter,
                                decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                  topLeft: const Radius.circular(10.0),
                                  topRight: const Radius.circular(10.0),
                                )),
                                child: Image.network(
                                    "https://www.themoviedb.org/t/p/w220_and_h330_face/" +
                                        movieStore
                                            .movieSelected.first.posterPath))),
                        SizedBox(
                          height: 16,
                        ),
                        Card(
                            margin: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 5.0),
                            clipBehavior: Clip.antiAlias,
                            elevation: 5.0,
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 10.0),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            "Popularidade",
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .secondaryHeaderColor,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            movieStore
                                                .movieSelected.first.popularity
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 15.0,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            "Nota",
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .secondaryHeaderColor,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            movieStore
                                                .movieSelected.first.voteAverage
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 15.0,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ))),
                        Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                movieStore.movieSelected.first.title,
                                style: TextStyle(
                                  color: Theme.of(context).secondaryHeaderColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Lançamento: " +
                                    movieStore.movieSelected.first.releaseDate,
                                style: TextStyle(),
                              ),
                              Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 10.0),
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    movieStore.movieSelected.first.overview,
                                    textAlign: TextAlign.justify,
                                  ))
                            ],
                          ),
                        )
                      ]))));
}

// Monta area de pesquisa
_search() {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: TextField(
          style: TextStyle(fontSize: 15),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: (text) {
            movieStore.filterMovie(text);
          }));
}

showAlertDialog(BuildContext context, Results movie) {
  Widget cancelaButton = FlatButton(
    child: Text("Cancelar"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget continuaButton = FlatButton(
    child: Text("Continar"),
    onPressed: () {
      movieStore.favoriteMovie(movie);
      Navigator.of(context).pop();
    },
  );
  //configura o AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Favoritos"),
    content: Text("Deseja adicionar o filme ao seus favoritos?"),
    actions: [
      cancelaButton,
      continuaButton,
    ],
  );
  //exibe showDialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
