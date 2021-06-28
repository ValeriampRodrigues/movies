import 'package:flutter/material.dart';
import 'package:movie/app/pages/about/about_page.dart';
import 'package:movie/app/pages/favorite/favorite_page.dart';
import 'package:movie/app/pages/movielist/movie_lista_page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0; // Variável para controlar o índice das telas
  final List<Widget> _pages = [Favorite(), MovieList(), About()];
  final List<String> _pagesTitle = ["Favoritos", "Filmes", "Sobre"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pagesTitle[_currentIndex]),
      ),
      body: _pages[_currentIndex], //Carrega pagina conforme tela selecionada
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, //Carrega o index da tela selecionada
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favoritos"),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Filmes"),
          BottomNavigationBarItem(icon: Icon(Icons.report), label: "Sobre"),
        ],
        onTap: onTabTapped, //Chamando método ao clicar em uma das opções
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index; // Altera o index da tela selecionada
    });
  }
}
