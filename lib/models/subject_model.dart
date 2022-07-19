import 'package:json_annotation/json_annotation.dart';
import 'package:school_app/models/grade_model.dart';

part 'subject_model.g.dart';

@JsonSerializable()
class Subject {
  String name;
  double finalGrade = 0;
  double? s;
  double? m;

  List<List<Grade>> gradeLists = [];
  List<String> gradeListNames = [];

  Subject({
    required this.name,
    this.s = 1,
    this.m = 1,
  });

  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectToJson(this);

  // Subject.fromJson(Map<String, dynamic> json)
  //     : name = json["name"],
  //       s = json["s"],
  //       m = json["m"],
  //       finalGrade = json["fg"],
  //       gradeListNames = (json["names"] as List<Map<String, String>>)
  //           .map((e) => e["name"] ?? "nothing found")
  //           .toList() {
  //   for (var i = 0; i < json["length"]; i++) {
  //     gradeLists[i] = (json["${i}gradeList"] as List)
  //         .map((x) => Grade.fromJson(x))
  //         .toList();
  //   }
  // }

  // Map<String, dynamic> toJson() {
  //   return {
  //     "name": name,
  //     "s": s,
  //     "m": m,
  //     "fg": finalGrade,
  //     "length": gradeLists.length,
  //     for (var i = 0; i < gradeLists.length; i++)
  //       "${i}gradeList": gradeLists[i].map((e) => e.toJson()).toList(),
  //     "names": gradeListNames.map((e) => {"name": e}),
  //   };
  // }
}
