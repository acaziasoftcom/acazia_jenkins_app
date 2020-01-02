import 'dart:convert';

import 'package:acazia_jenkins/entities/job.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import './api.dart';

class ApiProjects {
  static String token = DotEnv().env['JENKINS_TOKEN'];

  static AJClient _ajClient = AJClient();

  static Future<List<Job>> getProjects() async {
    var resp = await _ajClient.get('api/json?pretty=' + (true).toString());
    List<dynamic> respJson = json.decode(resp.body)['jobs'];
    List<Job> jobs = [];
    respJson.map((item) {
      return new Job(
          cls: item['_cls'],
          name: item['name'],
          color: item['color'],
          url: item['url']);
    }).forEach((n) {
      jobs.add(n);
    });
    return jobs;
  }

  static Future<dynamic> getProjectDetail(String url) async {
    var resp = await _ajClient.get(url.replaceAll(rootUrl, '') + 'api/json?pretty=true');
    print(url.replaceAll(rootUrl, '') + 'api/json?pretty=true');
    print(resp.body);

    Map<String, dynamic> data = Map();
    data['displayName'] = json.decode(resp.body);
    return resp;
  }

  static Future<dynamic> buildWithParams(String jobName, String targetEnv) async {
    var resp = await _ajClient.post(jobName);
  }
}
