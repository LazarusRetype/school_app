import 'package:school_app/models/grade_model.dart';

class Convert {
  String listToString(List<Grades> tests) => tests
      .map((e) => "${e.grade} ")
      .toString()
      .substring(1, tests.map((e) => "${e.grade} ").toString().length - 1);
}
