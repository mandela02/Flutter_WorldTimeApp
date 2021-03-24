import 'package:world_time/domain/entity/world_time.dart';

abstract class LoadingUseCaseType {
  Future<WorldTime> getWorldTime({String url});
}
