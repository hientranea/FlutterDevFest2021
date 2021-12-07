enum STATUS { success, fail }

class Resource<T> {
  final STATUS status;
  final T? data;
  final String message;

  Resource({required this.status, this.data, required this.message});

  factory Resource.success(T data, {String message = ""}) {
    return Resource(status: STATUS.success, data: data, message: message);
  }

  factory Resource.fail(String message) {
    return Resource(status: STATUS.fail, message: message);
  }

  bool isSuccess() => status == STATUS.success && data != null;
}
