import 'dart:convert';

import 'package:school_app/models/subject_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalSave {
  static save(List<Subject> subjects) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
        'subjects', subjects.map((e) => jsonEncode(e.toJson())).toList());
  }

  static Future<List<Subject>?> load() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs
        .getStringList('subjects')
        ?.map((e) => Subject.fromJson(jsonDecode(e)))
        .toList();
  }

  static removeAll() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
