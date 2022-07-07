class Subject {
  String name;
  double s;
  double m;
  List<double> shortTests;
  List<double> classTests;
  List<double> presentations;
  List<double> oralGrades;
  Subject({
    required this.name,
    required this.s,
    required this.m,
    required this.classTests,
    required this.oralGrades,
    required this.presentations,
    required this.shortTests,
  });

  Subject.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        s = json["s"],
        m = json["m"],
        classTests = json["orals"] as List<double>,
        shortTests = json["orals"] as List<double>,
        presentations = json["orals"] as List<double>,
        oralGrades = json["orals"] as List<double>;

  Map<String, dynamic> toJson() => {
        "name": name,
        "s": s,
        "m": m,
        "tests": shortTests,
        "works": classTests,
        "presentations": presentations,
        "orals": oralGrades
      };
}
