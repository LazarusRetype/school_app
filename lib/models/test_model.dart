class Test {
  int grade;
  Test({required this.grade});

  Test.fromJson(Map<String, dynamic> json) : grade = json["grade"];
  Map<String, dynamic> toJson() => {"grade": grade};
}
