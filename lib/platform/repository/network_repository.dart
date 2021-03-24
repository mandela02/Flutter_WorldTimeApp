import 'dart:convert';

import 'package:http/http.dart';
import 'package:world_time/Application/utilites/constants.dart';
import 'package:world_time/domain/entity/world_time.dart';

abstract class NetworkRepositoryType {
  Future<WorldTime> getTime(url);
  Future<String> getTimezoneList();
}

enum ApiResponse { success, failure }

extension ApiResponseExtension on ApiResponse {}

class NetWorkRepository implements NetworkRepositoryType {
  @override
  Future<WorldTime> getTime(url) async {
    Uri uri = Uri.https(Api.endPoint, Api.argument + url);
    try {
      final Response response = await get(uri);
      WorldTime time = WorldTime.fromJson(jsonDecode(response.body));
      return time;
    } catch (e) {
      throw Exception('Failed to load time $e');
    }
  }

  @override
  Future<String> getTimezoneList() async {
    // TODO: implement getTimezoneList
    Uri uri = Uri.https(Api.endPoint, Api.timezoneListArgument);
    Response response = await get(uri);
    return response.body;
  }
}
