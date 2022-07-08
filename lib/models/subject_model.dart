import 'package:school_app/models/grade_model.dart';

class Subject {
  String name;
  double finalGrade = 0;
  double? s;
  double? m;
  List<Grade> shortTests;
  List<Grade> classTests;
  List<Grade> presentations;
  List<Grade> oralGrades;

  Subject({
    required this.name,
    this.s,
    this.m,
    required this.classTests,
    required this.oralGrades,
    required this.presentations,
    required this.shortTests,
  });

  Subject.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        s = json["s"],
        m = json["m"],
        finalGrade = json["fg"],
        classTests =
            (json["classTests"] as List).map((e) => Grade.fromJson(e)).toList(),
        shortTests =
            (json["shortTests"] as List).map((e) => Grade.fromJson(e)).toList(),
        presentations = (json["presentations"] as List)
            .map((e) => Grade.fromJson(e))
            .toList(),
        oralGrades =
            (json["oralGrades"] as List).map((e) => Grade.fromJson(e)).toList();

  Map<String, dynamic> toJson() => {
        "name": name,
        "s": s,
        "m": m,
        "fg": finalGrade,
        "shortTests": shortTests.map((i) => i.toJson()).toList(),
        "classTests": classTests.map((i) => i.toJson()).toList(),
        "presentations": presentations.map((i) => i.toJson()).toList(),
        "oralGrades": oralGrades.map((i) => i.toJson()).toList(),
      };
}
