class DataResponse<T> {
  T? data;
  String? message;
  Status status;

  DataResponse.loading(this.message) : status = Status.LOADING;
  DataResponse.completed(this.data) : status = Status.COMPLETED;
  DataResponse.error(this.message) : status = Status.ERROR;
}

enum Status { LOADING, COMPLETED, ERROR }
