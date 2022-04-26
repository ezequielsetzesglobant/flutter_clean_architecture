abstract class DataState<T> {
  final T? data;
  final String? error;
  final DataStateType type;

  const DataState({
    this.data,
    this.error,
    required this.type,
  });
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data)
      : super(
          data: data,
          type: DataStateType.success,
        );
}

class DataEmpty<T> extends DataState<T> {
  const DataEmpty()
      : super(
          type: DataStateType.empty,
        );
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(String error)
      : super(
          error: error,
          type: DataStateType.error,
        );
}

enum DataStateType { success, empty, error }
