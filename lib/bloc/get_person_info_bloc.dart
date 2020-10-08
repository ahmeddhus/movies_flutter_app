import 'package:flutter/material.dart';
import 'package:movies_flutter_app/model/person_info_response.dart';
import 'package:movies_flutter_app/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class PersonsInfoBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<PersonInfoResponse> _subject =
  BehaviorSubject<PersonInfoResponse>();

  getPersonInfo(int id) async {
    PersonInfoResponse response = await _repository.getPersonInfo(id);
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


  BehaviorSubject<PersonInfoResponse> get subject => _subject;
}

final personsInfoBloc = PersonsInfoBloc();
