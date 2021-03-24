import 'package:flutter/material.dart';
import 'package:world_time/Application/utilites/extension/string_extension.dart';
import 'package:world_time/domain/entity/world_time.dart';
import 'package:world_time/domain/use_case/location_use_case_type.dart';
import 'package:world_time/platform/use_case/use_case_provider.dart';

class Location extends StatefulWidget {
  static const String route = "/location";
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  LocationUseCaseType useCase = UseCaseProvider().getLocationUseCase();
  List<String> locationList = [];
  void getData() async {
    List<String> dataList = await useCase.getAllLocation();
    setState(() {
      locationList = dataList;
    });
  }

  void getNewTimeZone({String url}) async {
    WorldTime worldTime = await useCase.getWorldTime(url: url);
    WorldTime argument = worldTime;
    Navigator.pop(context, {"newWorldTime": argument});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Location"),
      ),
      body: ListView.builder(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 100),
        itemCount: locationList.length,
        itemBuilder: (context, index) => CardLocationWidget(
          content: locationList[index],
          onCellSelect: () {
            getNewTimeZone(url: locationList[index]);
          },
        ),
      ),
    );
  }
}

class CardLocationWidget extends StatelessWidget {
  String text = "";
  Function selectedDelegate;

  CardLocationWidget({String content, Function onCellSelect}) {
    this.text = content;
    this.selectedDelegate = onCellSelect;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: selectedDelegate,
        title: Text(text.fromTimeZoneToTime),
      ),
    );
  }
}
