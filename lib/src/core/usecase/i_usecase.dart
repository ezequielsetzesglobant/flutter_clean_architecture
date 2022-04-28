import '../util/constants.dart';

abstract class IUsecase<T> {
  Future<T> call({int speciesId = Constants.defaultValue});
}
