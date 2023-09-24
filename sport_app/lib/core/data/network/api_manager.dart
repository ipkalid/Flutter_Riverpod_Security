import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'data_request.dart';
import 'network_error.dart';
import 'request_type.dart';

class APIManager {
  int _retryCounter = 0;
  Future<dynamic> call(
    DataRequest request, {
    Object? body,
  }) async {
    try {
      Response httpResponse = await _filterCall(request, body: body);

      if (httpResponse.statusCode < 200 || httpResponse.statusCode >= 300) {
        final statusCode = httpResponse.statusCode;
        final body = json.decode(httpResponse.body);
        throw InvalidServerResponse(statusCode: statusCode, body: body);
      }

      final data = json.decode(httpResponse.body);
      _retryCounter = 0;
      return data;
    } on SocketException catch (e) {
      if (_retryCounter > 10) {
        rethrow;
      }
      log(e.toString(), error: e);
      await Future.delayed(const Duration(seconds: 1));
      _retryCounter++;
      log("_retryCounter: ${_retryCounter.toString()}");
      return await call(request, body: body);
    }
  }

  Future<Response> _filterCall(DataRequest request, {Object? body}) async {
    switch (request.requestType) {
      case RequestType.get:
        return http.get(request.url, headers: request.headers);

      case RequestType.post:
        return http.post(request.url,
            headers: request.headers, body: jsonEncode(body));

      case RequestType.put:
        return http.put(request.url,
            headers: request.headers, body: jsonEncode(body));

      case RequestType.delete:
        return http.delete(request.url,
            headers: request.headers, body: jsonEncode(body));
    }
  }
}
