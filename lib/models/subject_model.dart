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
      : s = json["s"],
        m = json["m"],
        tests = json["tests"],
        works = json["works"],
        name = json["name"];

  Map<String, dynamic> toJson() => {
        "s": s,
        "m": m,
        "tests": tests,
        "works": works,
        "name": name,
      };
}
