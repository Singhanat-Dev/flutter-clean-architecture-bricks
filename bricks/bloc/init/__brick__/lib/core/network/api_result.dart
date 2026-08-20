sealed class ApiResult<T> {
  const ApiResult();

  factory ApiResult.success(T data) = Success<T>;
  factory ApiResult.failure(String message, {int? statusCode, dynamic error}) =
      Failure<T>;

  R when<R>({
    required R Function(T data) success,
    required R Function(String message, int? statusCode, dynamic error) failure,
  }) {
    return switch (this) {
      Success(:final data) => success(data),
      Failure(:final message, :final statusCode, :final error) =>
        failure(message, statusCode, error),
    };
  }
}

class Success<T> extends ApiResult<T> {
  final T data;
  const Success(this.data);
}

class Failure<T> extends ApiResult<T> {
  final String message;
  final int? statusCode;
  final dynamic error;

  const Failure(this.message, {this.statusCode, this.error});
}
