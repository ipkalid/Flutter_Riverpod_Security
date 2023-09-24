import '../network/data_request.dart';

enum DataRequests {
  getData;

  Iterable<String> path() {
    return switch (this) {
      getData => ["data"],
    };
  }

  DataRequest request() {
    return DataRequest(
      path: path(),
    );
  }
}
