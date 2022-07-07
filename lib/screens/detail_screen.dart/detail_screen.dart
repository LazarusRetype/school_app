import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_app/models/subject_model.dart';

class DetailScreen extends StatelessWidget {
  Subject _subject;
  DetailScreen(this._subject, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_subject.name)),
    );
  }
}
