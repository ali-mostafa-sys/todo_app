enum HTTPMethod { get, post, delete, put, patch }

extension HTTPMethodString on HTTPMethod {
  String get string {
    switch (this) {
      case HTTPMethod.get:
        return "get";
      case HTTPMethod.post:
        return "post";
      case HTTPMethod.delete:
        return "delete";
      case HTTPMethod.patch:
        return "patch";
      case HTTPMethod.put:
        return "put";
    }
  }
}

class APIRequest {
  String endPoint;
  HTTPMethod method;
  Map<String, String>? headers;
  Map<String, String>? query;
  dynamic body;
  APIRequest(
      {required this.endPoint,
      required this.method,
      this.body,
      this.headers,
      this.query});
}
