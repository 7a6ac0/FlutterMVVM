enum ResponseState{
  LOADING,
  SUCCESS,
  ERROR
}

class Response<T> {
  ResponseState state;
  T? data;
  String? exception;

  Response({required this.state, this.data, this.exception});

  static Response<T> loading<T>() {
    return Response(state: ResponseState.LOADING);
  }

  static Response<T> success<T>(T? data) {
    return Response(state: ResponseState.SUCCESS, data: data);
  }

  static Response<T> error<T>(String? exception) {
    return Response(state: ResponseState.ERROR, exception: exception);
  }
}