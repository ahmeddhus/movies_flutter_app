import 'package:flutter/material.dart';
import 'package:movies_flutter_app/bloc/get_person_info_bloc.dart';
import 'package:movies_flutter_app/model/person_info_response.dart';
import 'package:movies_flutter_app/style/theme.dart' as Style;

class PersonInfo extends StatefulWidget {
  final int id;

  PersonInfo({Key key, @required this.id}) : super(key: key);

  @override
  _PersonInfoState createState() => _PersonInfoState(id);
}

class _PersonInfoState extends State<PersonInfo> {
  final int id;

  _PersonInfoState(this.id);

  @override
  void initState() {
    super.initState();
    personsInfoBloc..getPersonInfo(id);
  }

  @override
  void dispose() {
    super.dispose();
    personsInfoBloc..drainStream();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PersonInfoResponse>(
        stream: personsInfoBloc.subject.stream,
        builder: (contex, AsyncSnapshot<PersonInfoResponse> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.error != null && snapshot.data.error.length > 0) {
              return _buildErrorWidget(snapshot.data.error);
            }
            return _buildInfoWidget(snapshot.data);
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

  Widget _buildInfoWidget(PersonInfoResponse data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Column(
            children: [
              Text(
                '${data.name}',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Style.Colors.mainColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 4.0,
              ),
              Text(
                '${data.placeOfBirth}',
                style: TextStyle(fontSize: 16.0, color: Style.Colors.mainColor),
              ),
              SizedBox(
                height: 4.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${data.birthday}',
                    style: TextStyle(
                        fontSize: 14.0, color: Style.Colors.mainColor),
                  ),
                  Text(
                    ' : ',
                    style: TextStyle(
                        fontSize: 14.0, color: Style.Colors.mainColor),
                  ),
                  Text(
                    '${data.deathday}',
                    style: TextStyle(
                        fontSize: 14.0, color: Style.Colors.mainColor),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 200,
                width: 300,
                child: SingleChildScrollView(
                  child: Text(
                    '${data.biography}',
                    style: TextStyle(
                        fontSize: 16.0, color: Style.Colors.mainColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
