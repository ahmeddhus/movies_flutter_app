import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:movies_flutter_app/style/theme.dart' as Style;
import 'package:movies_flutter_app/widgets/genres.dart';
import 'package:movies_flutter_app/widgets/now_playing.dart';
import 'package:movies_flutter_app/widgets/persons.dart';
import 'package:movies_flutter_app/widgets/top_movies.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.Colors.mainColor,
      appBar: AppBar(
        backgroundColor: Style.Colors.mainColor,
        centerTitle: true,
        leading: Icon(
          EvaIcons.menu2Outline,
          color: Colors.white,
        ),
        title: Text("Movies App"),
        actions: <Widget>[
          IconButton(
              icon: Icon(EvaIcons.searchOutline, color: Colors.white),
              onPressed: null)
        ],
      ),
      body: ListView(
        children: <Widget>[
          NowPlaying(),
          GenresScreen(),
          PersonsList(),
          TopMovies(),
        ],
      ),
    );
  }
}
