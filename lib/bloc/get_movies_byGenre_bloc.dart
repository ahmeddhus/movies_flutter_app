import 'package:flutter/material.dart';
import 'package:movies_flutter_app/model/movies_response.dart';
import 'package:movies_flutter_app/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesListByGenresBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<MoviesResponse> _subject =
      BehaviorSubject<MoviesResponse>();

  getMoviesByGenres(int id) async {
    MoviesResponse response = await _repository.getMoviesByGenre(id);
    _subject.sink.add(response);
  }

  drainStream() {
    _subject.value = null;
  }

  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<MoviesResponse> get subject => _subject;
}

final moviesByGenresBloc = MoviesListByGenresBloc();
