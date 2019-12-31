import 'dart:convert';

class Job {
  final String cls;
  final String name;
  final String url;
  final String color;

  Job({this.cls, this.name, this.url, this.color});

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(cls: json['_class'], name: json['name'], url: json['initial'], color: json['color']);
  }

  static List<Job> fromJsonArray(String jsonArray) {
    Iterable rawList = json.decode(jsonArray);
    print(rawList.toString());
    return rawList.map((p) => Job.fromJson(p)).toList();
  }

  Map<String, dynamic> toJson() => {'_class': cls, 'name': name, 'url': url, 'color': color};
}
