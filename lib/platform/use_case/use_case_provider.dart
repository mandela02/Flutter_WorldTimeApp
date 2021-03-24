import 'package:world_time/domain/use_case/home_use_case_type.dart';
import 'package:world_time/domain/use_case/location_use_case_type.dart';
import 'package:world_time/platform/repository/network_repository.dart';
import 'package:world_time/platform/use_case/loading_use_case.dart';
import 'package:world_time/platform/use_case/location_use_case.dart';

class UseCaseProvider {
  NetworkRepositoryType _netWorkRepository;

  UseCaseProvider() {
    this._netWorkRepository = NetWorkRepository();
  }

  LocationUseCaseType getLocationUseCase() {
    return LocationUseCase(repository: _netWorkRepository);
  }

  LoadingUseCaseType getLoadingUseCase() {
    return LoadingUseCase(repository: _netWorkRepository);
  }
}
