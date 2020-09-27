import 'package:movies_flutter_app/model/person.dart';

class PersonResponse {
  final List<Person> person;
  final String error;


  PersonResponse(this.person, this.error);

  PersonResponse.fromJson(Map<String, dynamic> json)
      : person = (json["results"] as List)
      .map((e) => new Person.fromJson(e))
      .toList(),
        error = "";

  PersonResponse.withError(String errorValue)
      : person = List(),
        error = errorValue;
}