import 'package:json_annotation/json_annotation.dart';

part 'grade_model.g.dart';

@JsonSerializable()
class Grade {
  double grade;
  Grade(this.grade);

  factory Grade.fromJson(Map<String, dynamic> json) => _$GradeFromJson(json);

  Map<String, dynamic> toJson() => _$GradeToJson(this);

  //Grade.fromJson(Map<String, dynamic> json) : grade = json["grade"];
  //Map<String, dynamic> toJson() => {"grade": grade};
}
