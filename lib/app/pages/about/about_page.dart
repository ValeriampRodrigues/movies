import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _aboutState createState() => _aboutState();
}

class _aboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
      Container(
          decoration: BoxDecoration(boxShadow: [
            new BoxShadow(
              color: Colors.grey[500],
              blurRadius: 20.0,
              spreadRadius: 1.0,
            )
          ]),
          child: Container(
            width: double.infinity,
            height: 10.0,
          )),
      Container(
          width: MediaQuery.of(context).size.width * 0.50,
          height: MediaQuery.of(context).size.height * 0.50,
          alignment: Alignment.center,
          child: Image.asset(
            "assets/themoviewdb.png",
          )),
      Container(
        alignment: Alignment.center,
        child: Center(child: Text("This product uses the TMDb API!")),
      ),
      Container(
        alignment: Alignment.center,
        child: Center(child: Text("But is not endorsed or certified by TMDb.")),
      ),
    ])));
  }
}
