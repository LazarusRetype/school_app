import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_app/models/subject_model.dart';
import 'package:school_app/models/grade_model.dart';
import 'package:school_app/screens/homescreen/subjects_provider.dart';
import 'package:school_app/screens/homescreen/subjects_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SubjectsProvider>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(title: Text(value.subjects.length.toString())),
        body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0),
            itemCount: value.subjects.length,
            itemBuilder: (_, index) => SubjectTile(value.subjects[index])),
        floatingActionButton: FloatingActionButton(
          onPressed: (() => value.addSubject(Subject(
                  name: "Mathe",
                  s: 5,
                  m: 4,
                  works: [
                    Grades(grade: 2),
                    Grades(grade: 3),
                    Grades(grade: 1)
                  ],
                  oralGrades: [
                    Grades(grade: 1),
                    Grades(grade: 1),
                    Grades(grade: 1)
                  ],
                  tests: [
                    Grades(grade: 4),
                    Grades(grade: 4)
                  ]))),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
