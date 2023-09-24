import '../network/request_type.dart';
import '../network/data_request.dart';

enum AuthRequests {
  login;

  Iterable<String> path() {
    return switch (this) {
      login => ["login"],
    };
  }

  DataRequest request() {
    return DataRequest(path: path(), requestType: RequestType.post);
  }
}
