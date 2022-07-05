import 'package:school_app/models/test_model.dart';

class Subject {
  String name;
  int s;
  int m;
  List<Test> tests;
  List<Test> works;
  Subject({
    required this.name,
    required this.s,
    required this.m,
    required this.works,
    required this.tests,
  });

  Subject.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        s = json["s"],
        m = json["m"],
        works = (json["works"] as List).map((e) => Test.fromJson(e)).toList(),
        tests = (json["tests"] as List).map((e) => Test.fromJson(e)).toList();

  Map<String, dynamic> toJson() => {
        "name": name,
        "s": s,
        "m": m,
        "tests": tests.map((i) => i.toJson()).toList(),
        "works": works.map((i) => i.toJson()).toList(),
      };
}
