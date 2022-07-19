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
    notifyListeners();
    LocalSave.save(_subjects);
  }

  addSubject(Subject subject) {
    _subjects.add(subject);
    notifyListeners();
    LocalSave.save(_subjects);
  }

  addGrade(int subjectIndex, listIndex, Grade grade) {
    _subjects[subjectIndex].gradeLists[listIndex].add(grade);
    notifyListeners();
    LocalSave.save(_subjects);
  }

  setGrade(int subjectIndex, listIndex, gradeIndex, Grade grade) {
    _subjects[subjectIndex].gradeLists[listIndex][gradeIndex] = grade;
    notifyListeners();
    LocalSave.save(_subjects);
  }

  removeAll() {
    _subjects.clear();
    notifyListeners();
    LocalSave.save(_subjects);
  }

  sort() {
    calculateFinalGradeAtFirstIndex();
    _subjects.sort((a, b) => a.finalGrade.compareTo(b.finalGrade));
  }

  void calculateFinalGradeAtFirstIndex() {
    for (var s in _subjects) {
      if (s.gradeLists[0].isNotEmpty) {
        s.finalGrade =
            s.gradeLists[0].reduce((a, b) => Grade(a.grade + b.grade)).grade /
                s.gradeLists[0].length;
      }
    }
  }

  void changeSubject(int subjectIndex, Subject subject) {
    _subjects[subjectIndex].m = subject.m;
    _subjects[subjectIndex].s = subject.s;
    _subjects[subjectIndex].name = subject.name;
  }

  void remove(int indexOfSubject) {
    _subjects.removeAt(indexOfSubject);
    LocalSave.save(_subjects);
  }

  void addGradeList(String name, int subjectIndex) {
    _subjects[subjectIndex].gradeLists.add([]);
    _subjects[subjectIndex].gradeListNames.add(name);
    notifyListeners();
    LocalSave.save(_subjects);
  }

  void setGradeListName(String name, int subjectIndex, listIndex) {
    _subjects[subjectIndex].gradeListNames[listIndex] = name;
    notifyListeners();
    LocalSave.save(_subjects);
  }
}
