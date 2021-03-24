import 'package:flutter/material.dart';
import 'package:world_time/Application/utilites/extension/string_extension.dart';
import 'package:world_time/Application/views/location.dart';
import 'package:world_time/domain/entity/world_time.dart';

class Home extends StatefulWidget {
  static const String route = "/home";

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map _data = {};
  WorldTime _worldTime = WorldTime();
  @override
  void initState() {
    super.initState();
  }

  void goToLocation() async {
    dynamic result = await Navigator.pushNamed(context, Location.route);
    setState(() {
      _data = {"worldTime": result["newWorldTime"]};
    });
  }

  @override
  Widget build(BuildContext context) {
    _data =
        _data.isNotEmpty ? _data : ModalRoute.of(context).settings.arguments;
    _worldTime = _data["worldTime"];
    String backgroundImageString =
        _worldTime.isDayTime ? "day.png" : "night.png";
    Color bgColor = _worldTime.isDayTime ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/$backgroundImageString",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              locationButton,
              SizedBox(
                height: 20,
              ),
              locationTitle,
              SizedBox(
                height: 50,
              ),
              timeText,
            ],
          ),
        ),
      ),
    );
  }

  Widget get locationButton {
    return TextButton.icon(
      onPressed: () {
        goToLocation();
      },
      icon: Icon(
        Icons.edit_location,
        color: Colors.white,
      ),
      label: Text(
        "Location",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  Widget get locationTitle {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _worldTime.timezone.fromTimeZoneToTime,
          style: TextStyle(
            fontSize: 28,
            letterSpacing: 2,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget get timeText {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _worldTime.formattedDateString,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 70,
            letterSpacing: 3,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
