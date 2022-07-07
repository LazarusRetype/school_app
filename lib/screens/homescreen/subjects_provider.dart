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
    notifyListeners();
  }

  addSubject(Subject subject) {
    _subjects.add(subject);
    notifyListeners();
    LocalSave.save(_subjects);
  }

  removeAll() {
    _subjects.clear();
    notifyListeners();
    LocalSave.save(_subjects);
  }
}
