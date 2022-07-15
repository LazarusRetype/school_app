import 'package:school_app/models/grade_model.dart';

class Subject {
  String name;
  double finalGrade = 0;
  double? s;
  double? m;

  List<List<Grade>> gradeLists = [];

  Subject({
    required this.name,
    this.s = 1,
    this.m = 1,
  });

  Subject.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        s = json["s"],
        m = json["m"],
        finalGrade = json["fg"] {
    for (var i = 0; i < json["length"]; i++) {
      gradeLists[i] = (json["${i}gradeList"] as List)
          .map((x) => Grade.fromJson(x))
          .toList();
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "s": s,
      "m": m,
      "fg": finalGrade,
      "length": gradeLists.length,
      for (var i = 0; i < gradeLists.length; i++)
        "${i}gradeList": gradeLists[i].map((e) => e.toJson()).toList(),
    };
  }
}
