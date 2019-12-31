import './api.dart';

class ApiProjects {
  static AJClient ajClient = AJClient();

  static Future getProjects () {
    return ajClient.get('api/json?pretty=true');
  }
}