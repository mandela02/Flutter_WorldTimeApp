import 'package:world_time/domain/entity/world_time.dart';

abstract class LocationUseCaseType {
  Future<List<String>> getAllLocation();
  Future<WorldTime> getWorldTime({String url});
}
