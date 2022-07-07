class Grades {
  int grade;
  Grades({required this.grade});

  Grades.fromJson(Map<String, dynamic> json) : grade = json["grade"];
  Map<String, dynamic> toJson() => {"grade": grade};
}
