import 'package:flutter/material.dart';
import 'package:movies_flutter_app/bloc/get_genres_bloc.dart';
import 'package:movies_flutter_app/model/genre.dart';
import 'package:movies_flutter_app/model/genre_response.dart';
import 'package:movies_flutter_app/widgets/genres_list.dart';

class GenresScreen extends StatefulWidget {
  @override
  _GenresState createState() => _GenresState();
}

class _GenresState extends State<GenresScreen> {
  @override
  void initState() {
    genresBloc.getGenres();
  }


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<GenreResponse>(
        stream: genresBloc.subject.stream,
        builder: (contex, AsyncSnapshot<GenreResponse> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.error != null && snapshot.data.error.length > 0) {
              return _buildErrorWidget(snapshot.data.error);
            }
            return _buildGenresWidget(snapshot.data);
          } else if (snapshot.hasError) {
            return _buildErrorWidget(snapshot.error);
          } else {
            return _buildLoadingWidget();
          }
        });
  }

  Widget _buildLoadingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 25.0,
            width: 25.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 4.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorWidget(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Error Occurred: $error"),
        ],
      ),
    );
  }

  Widget _buildGenresWidget(GenreResponse data) {
    List<Genre> genres = data.genre;
    if (genres.length == 0) {
      return Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("No Movies"),
          ],
        ),
      );
    } else
      return GenresList(genres: genres);
  }
}
