class Result<T> {
  final T? data;
  final String? error;

  const Result.success(this.data) : error = null;
  const Result.error(this.error) : data = null;
  bool get isSuccess => error == null;
}
