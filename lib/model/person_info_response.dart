class PersonInfoResponse {
   int id;
   double popularity;
   String name;
   String profileImg;
   String placeOfBirth;
   String birthday;
   String deathday;
   String biography;

  PersonInfoResponse(this.id, this.popularity, this.name, this.profileImg,
      this.placeOfBirth, this.birthday, this.deathday, this.biography);

  PersonInfoResponse.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        popularity = json["popularity"],
        name = json["name"]??'',
        profileImg = json["profile_path"]??'',
        placeOfBirth = json["place_of_birth"]??'',
        birthday = json["birthday"]??'',
        deathday = json["deathday"]??'--',
        biography = json["biography"]??'';


   PersonInfoResponse personInfoResponse;
   String error;

  PersonInfoResponse.withError(String errorValue)
      : personInfoResponse = PersonInfoResponse(0, 0.0, '', '', '', '', '', ''),
        error = errorValue;
}
