import 'package:world_time/domain/entity/world_time.dart';
import 'package:world_time/domain/use_case/home_use_case_type.dart';
import 'package:world_time/platform/repository/network_repository.dart';

class LoadingUseCase implements LoadingUseCaseType {
  NetWorkRepository _repository;

  LoadingUseCase({NetWorkRepository repository}) {
    this._repository = repository;
  }

  @override
  Future<WorldTime> getWorldTime({String url}) {
    // TODO: implement getWorldTime
    return _repository.getTime(url);
  }
}
