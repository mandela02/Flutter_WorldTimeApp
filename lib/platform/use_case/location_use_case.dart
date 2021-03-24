import 'package:world_time/domain/entity/world_time.dart';
import 'package:world_time/domain/use_case/location_use_case_type.dart';
import 'package:world_time/platform/repository/network_repository.dart';

class LocationUseCase implements LocationUseCaseType {
  NetWorkRepository _repository;

  LocationUseCase({NetWorkRepository repository}) {
    this._repository = repository;
  }

  @override
  Future<List<String>> getAllLocation() async {
    // TODO: implement getAllLocation
    String result = await _repository.getTimezoneList();
    result = result.replaceAll("[", "");
    result = result.replaceAll("]", "");
    result = result.replaceAll("\"", "");
    return result.split(",");
  }

  @override
  Future<WorldTime> getWorldTime({String url}) {
    // TODO: implement getWorldTime
    return _repository.getTime(url);
  }
}
