import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/Application/views/home.dart';
import 'package:world_time/domain/entity/world_time.dart';
import 'package:world_time/domain/use_case/home_use_case_type.dart';
import 'package:world_time/platform/use_case/use_case_provider.dart';

class Loading extends StatefulWidget {
  static const String route = "/";
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  LoadingUseCaseType useCase = UseCaseProvider().getLoadingUseCase();
  String _text = "";

  void getData() async {
    WorldTime worldTime = await useCase.getWorldTime(url: "Asia/Ho_Chi_Minh");
    WorldTime argument = worldTime;
    Navigator.pushReplacementNamed(context, Home.route,
        arguments: {"worldTime": argument});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: SafeArea(
        child: Center(
          child: SpinKitFadingCube(
            color: Colors.white,
            size: 100,
          ),
        ),
      ),
    );
  }
}
