import 'package:school_app/models/grade_model.dart';

class Subject {
  String name;
  int s;
  int m;
  List<Grades> tests;
  List<Grades> oralGrades;
  List<Grades> works;
  Subject({
    required this.name,
    required this.s,
    required this.m,
    required this.works,
    required this.oralGrades,
    required this.tests,
  });

  Subject.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        s = json["s"],
        m = json["m"],
        works = (json["works"] as List).map((e) => Grades.fromJson(e)).toList(),
        tests = (json["tests"] as List).map((e) => Grades.fromJson(e)).toList(),
        oralGrades =
            (json["orals"] as List).map((e) => Grades.fromJson(e)).toList();

  Map<String, dynamic> toJson() => {
        "name": name,
        "s": s,
        "m": m,
        "tests": tests.map((i) => i.toJson()).toList(),
        "works": works.map((i) => i.toJson()).toList(),
        "orals": oralGrades.map((i) => i.toJson()).toList(),
      };
}
