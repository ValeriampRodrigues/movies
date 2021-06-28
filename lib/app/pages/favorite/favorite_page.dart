import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movie/app/models/movie_model.dart';
import 'package:movie/app/pages/favorite/favorite_store.dart';

class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

final favoriteStore = FavoriteStore();

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(
        child: Column(children: [
      Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          height: MediaQuery.of(context).size.height,
          child: FutureBuilder<bool>(
              future: favoriteStore.fetchFavorite(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Column(children: [
                    Center(
                        child:
                            Text("Você ainda não tem favoritos selecionado")),
                    Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.favorite_border,
                          color: Colors.red,
                        ))
                  ]);
                } else if (snapshot.hasData) {
                  return Observer(
                      builder: (_) => ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: favoriteStore.favoriteMovies.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () {
                                    showAlertDialog(context,
                                        favoriteStore.favoriteMovies[index]);
                                  },
                                  child: _getFavorite(context,
                                      favoriteStore.favoriteMovies[index]));
                            },
                          ));
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }))
    ]));
  }
}
//montaCards de filmes

_getFavorite(BuildContext context, Results movie) {
  return new Column(
    children: [
      Text(
        movie.title,
        style: TextStyle(
          color: Theme.of(context).secondaryHeaderColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Container(
        width: MediaQuery.of(context).size.width * 0.4,
        child: Card(
          color: Colors.transparent,
          child: Container(
              child: Image.network(
            "https://www.themoviedb.org/t/p/w220_and_h330_face/" +
                movie.posterPath,
          )),
        ),
      )
    ],
  );
}

showAlertDialog(BuildContext context, movie) {
  Widget cancelaButton = FlatButton(
    child: Text("Cancelar"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget continuaButton = FlatButton(
    child: Text("Continar"),
    onPressed: () {
      favoriteStore.favoriteMovie(movie);
      Navigator.of(context).pop();
    },
  );
  //configura o AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Favoritos"),
    content: Text("Deseja retirar filme dos favoritos?"),
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
