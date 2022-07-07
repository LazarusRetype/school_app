class Grade {
  double grade;
  Grade(this.grade);

  Grade.fromJson(Map<String, dynamic> json) : grade = json["grade"];
  Map<String, dynamic> toJson() => {"grade": grade};
}
