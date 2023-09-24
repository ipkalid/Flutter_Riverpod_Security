import '../api_constant.dart';
import 'network_error.dart';
import 'request_type.dart';

class DataRequest {
  String host;
  Iterable<String> defaultPath;
  Iterable<String> path;
  RequestType requestType;
  Map<String, dynamic>? params;
  Map<String, String>? urlParams;
  Map<String, String>? headers;
  int port;

  DataRequest({
    this.host = APIConstants.host,
    this.defaultPath = APIConstants.defaultPath,
    this.path = const [],
    this.requestType = RequestType.get,
    this.headers = const {'Content-Type': 'application/json'},
    this.params,
    this.port = APIConstants.port,
  });

  Uri get url => _url();

  Uri _url() {
    final Uri url;
    try {
      url = Uri(
        scheme: RequestScheme.http.value,
        host: host,
        port: port,
        pathSegments: defaultPath.followedBy(path),
        queryParameters: urlParams,
      );
    } catch (e) {
      throw InvalidURL();
    }
    return url;
  }

  @override
  String toString() {
    return "API_CALL: [URL: ${url.toString()}, METHOD: ${requestType.value}]";
  }
}
