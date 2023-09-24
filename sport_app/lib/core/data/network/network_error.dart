class InvalidServerResponse implements Exception {
  int statusCode;
  Map<String, dynamic>? body;
  InvalidServerResponse({required this.statusCode, this.body});
  @override
  String toString() {
    return "Invalid Server Response: $statusCode, body: $body";
  }
}

class InvalidURL implements Exception {
  @override
  String toString() {
    return "Invalid URL";
  }
}
