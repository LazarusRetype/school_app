import 'dart:convert';

import 'package:school_app/models/subject_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalSave {
  static save(List<Subject> movies) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
        'subjects', movies.map((e) => jsonEncode(e.toJson())).toList());
  }

  static Future<List<Subject>?> load() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs
        .getStringList('subjects')
        ?.map((e) => Subject.fromJson(jsonDecode(e)))
        .toList();
  }
}
