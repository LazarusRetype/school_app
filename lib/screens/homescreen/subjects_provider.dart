import 'package:flutter/cupertino.dart';
import 'package:school_app/models/subject_model.dart';
import 'package:school_app/services/localsave.dart';

class SubjectsProvider extends ChangeNotifier {
  List<Subject> _subjects = List.empty(growable: true);

  SubjectsProvider() {
    getData();
  }

  List<Subject> get subjects => _subjects;

  getData() async {
    _subjects = await LocalSave.load() ?? [];
    sort();
  }

  addSubject(Subject subject) {
    _subjects.add(subject);
    sort();
  }

  removeAll() {
    _subjects.clear();
    sort();
  }

  sort() {
    calculateFinalGrade();
    _subjects.sort((a, b) => a.finalGrade.compareTo(b.finalGrade));
    notifyListeners();
    LocalSave.save(_subjects);
  }

  void calculateFinalGrade() {
    for (var s in _subjects) {
      s.finalGrade = s.classTests.map((e) => e.grade).reduce((a, b) => a + b) /
          s.classTests.length;
    }
  }
}
