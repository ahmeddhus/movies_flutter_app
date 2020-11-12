import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:movies_flutter_app/style/theme.dart' as Style;
import 'package:movies_flutter_app/widgets/genres.dart';
import 'package:movies_flutter_app/widgets/now_playing.dart';
import 'package:movies_flutter_app/widgets/persons.dart';
import 'package:movies_flutter_app/widgets/top_movies.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Icon _searchIcon = new Icon(EvaIcons.searchOutline, color: Colors.white);
  Widget _appBarTitle = new Text('Search');
  final TextEditingController _search = new TextEditingController();
  bool search = true;


  @override
  void initState() {
    super.initState();
    _search.addListener(() {

    });
  }

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
        title: _appBarTitle,
        actions: <Widget>[
          IconButton(
              icon: _searchIcon,
              onPressed: (){
                setState(() {
                  if (search) {
                    search=false;
                    this._searchIcon = new Icon(Icons.close, color: Colors.white);
                    this._appBarTitle = new TextField(
                      controller: _search,
                      decoration: new InputDecoration(
                        prefixIcon: new Icon(EvaIcons.searchOutline, color: Colors.white),
                        hintText: 'Search...',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    );
                  } else {
                    search=true;
                    this._searchIcon = new Icon(EvaIcons.searchOutline, color: Colors.white);
                    this._appBarTitle = new Text('Movies App');
                    // filteredNames = names;
                    _search.clear();
                  }
                });
              })
        ],
      ),
      body: ListView(
        children: <Widget>[

        ],
      ),
    );
  }
}
