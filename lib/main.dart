import 'package:flutter/material.dart';
import 'package:movie/app/pages/home/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.purple[500],
        accentColor: Colors.teal[700],
        secondaryHeaderColor: Colors.teal[200],
        fontFamily: 'Roboto',
      ),
      home: Home(),
    );
  }
}
