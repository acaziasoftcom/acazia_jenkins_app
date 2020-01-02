import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

String rootUrl = DotEnv().env['ROOT_URL'];
String baseUrl = DotEnv().env['BASE_URL'];

class AJClient extends http.BaseClient {
  var client = http.Client();

  @override
  Future<http.Response> get(url, {Map<String, String> headers}) {
    return client.get(baseUrl + url, headers: headers);
  }

  @override
  Future<http.Response> post(url,
      {Map<String, String> headers, body, Encoding encoding}) {
    return client.post(url, headers: headers, encoding: encoding);
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    throw UnimplementedError();
  }
}
