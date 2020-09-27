import 'package:movies_flutter_app/model/genre.dart';

class GenreResponse {
  final List<Genre> genre;
  final String error;

  GenreResponse(this.genre, this.error);

  GenreResponse.fromJson(Map<String, dynamic> json)
      : genre = (json["genres"] as List)
      .map((e) => new Genre.fromJson(e))
      .toList(),
        error = "";

  GenreResponse.withError(String errorValue)
      : genre = List(),
        error = errorValue;
}