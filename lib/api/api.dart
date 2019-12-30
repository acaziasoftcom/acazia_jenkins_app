import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

var client = http.Client();
String baseUrl = DotEnv().env['BASE_URL'];

Future<http.Response> fetchProjects () {
  return client.get(baseUrl + 'api/json?pretty=true');
}