import 'package:dio/dio.dart';
import 'package:movies_flutter_app/model/cast_response.dart';
import 'package:movies_flutter_app/model/genre_response.dart';
import 'package:movies_flutter_app/model/movie_detail_response.dart';
import 'package:movies_flutter_app/model/movies_response.dart';
import 'package:movies_flutter_app/model/person_info_response.dart';
import 'package:movies_flutter_app/model/person_response.dart';
import 'package:movies_flutter_app/model/video_response.dart';

class MovieRepository {
  final String apiKey = "6c20bdc9fb3e86590c16b5f77d4754c7";
  static String mainUrl = "https://api.themoviedb.org/3";
  final Dio _dio = Dio();

  var getPopularUrl = '$mainUrl/movie/top_rated';
  var getMoviesUrl = '$mainUrl/discover/movie';
  var getPlayingUrl = '$mainUrl/movie/now_playing';
  var getGenresUrl = '$mainUrl/genre/movie/list';
  var getPersonsUrl = '$mainUrl/trending/person/week';
  var getPersonInfoUrl = '$mainUrl/person';
  var movieUrl = '$mainUrl/movie';

  Future<MoviesResponse> getMovies() async {
    var params = {"api_key": apiKey, "language": "en-US", "page": 1};

    try {
      Response response =
          await _dio.get(getPopularUrl, queryParameters: params);
      return MoviesResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");
      return MoviesResponse.withError("$error");
    }
  }

  Future<MoviesResponse> getPlayingMovies() async {
    var params = {"api_key": apiKey, "language": "en-US", "page": 1};

    try {
      Response response =
          await _dio.get(getPlayingUrl, queryParameters: params);
      return MoviesResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");
      return MoviesResponse.withError("$error");
    }
  }

  Future<GenreResponse> getGenres() async {
    var params = {"api_key": apiKey, "language": "en-US", "page": 1};

    try {
      Response response = await _dio.get(getGenresUrl, queryParameters: params);
      return GenreResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");
      return GenreResponse.withError("$error");
    }
  }

  Future<PersonResponse> getPersons() async {
    var params = {
      "api_key": apiKey,
    };

    try {
      Response response =
          await _dio.get(getPersonsUrl, queryParameters: params);
      return PersonResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");
      return PersonResponse.withError("$error");
    }
  }

  Future<PersonInfoResponse> getPersonInfo(int id) async {
    var params = {
      "api_key": apiKey,
      "language": "en-US",
    };

    try {
      Response response =
          await _dio.get(getPersonInfoUrl + "/$id", queryParameters: params);
      return PersonInfoResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");
      return PersonInfoResponse.withError("error");
    }
  }

  Future<MoviesResponse> getMoviesByGenre(int id) async {
    var params = {
      "api_key": apiKey,
      "language": "en-US",
      "page": 1,
      "with_genres": id
    };

    try {
      Response response = await _dio.get(getMoviesUrl, queryParameters: params);
      return MoviesResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");
      return MoviesResponse.withError("$error");
    }
  }

  Future<MovieDetailResponse> getMovieDetail(int id) async {
    var params = {
      "api_key": apiKey,
      "language": "en-US",
    };

    try {
      Response response =
          await _dio.get(movieUrl + "/$id", queryParameters: params);
      return MovieDetailResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");
      return MovieDetailResponse.withError("$error");
    }
  }

  Future<CastResponse> getCast(int id) async {
    var params = {
      "api_key": apiKey,
      "language": "en-US",
    };

    try {
      Response response = await _dio.get(movieUrl + "/$id" + "/credits",
          queryParameters: params);
      return CastResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");
      return CastResponse.withError("$error");
    }
  }

  Future<MoviesResponse> getSimilarMovies(int id) async {
    var params = {
      "api_key": apiKey,
      "language": "en-US",
    };

    try {
      Response response = await _dio.get(movieUrl + "/$id" + "/similar",
          queryParameters: params);
      return MoviesResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");
      return MoviesResponse.withError("$error");
    }
  }

  Future<VideoResponse> getMoviesVideos(int id) async {
    var params = {
      "api_key": apiKey,
      "language": "en-US",
    };

    try {
      Response response = await _dio.get(movieUrl + "/$id" + "/videos",
          queryParameters: params);
      return VideoResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");
      return VideoResponse.withError("$error");
    }
  }
}
