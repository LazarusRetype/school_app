import 'package:flutter/cupertino.dart';
import 'package:school_app/models/grade_model.dart';
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

  addClassTest(Subject subject, Grade grade) {
    subjects[subjects.indexOf(subject)].classTests.add(grade);
    sort();
  }

  addOralTest(Subject subject, Grade grade) {
    subjects[subjects.indexOf(subject)].oralGrades.add(grade);
    sort();
  }

  addShortTest(Subject subject, Grade grade) {
    subjects[subjects.indexOf(subject)].shortTests.add(grade);
    sort();
  }

  addPresentationTest(Subject subject, Grade grade) {
    subjects[subjects.indexOf(subject)].classTests.add(grade);
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
      if (s.classTests.isNotEmpty) {
        s.finalGrade =
            s.classTests.reduce((a, b) => Grade(a.grade + b.grade)).grade /
                s.classTests.length;
      }
    }
  }

  void changeSubject(int index, Subject subject) {
    subjects[index] = subject;
    sort();
  }

  void remove(int indexOfSubject) {
    subjects.removeAt(indexOfSubject);
    sort();
  }
}
