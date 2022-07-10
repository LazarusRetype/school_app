import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_app/constants/app_colors.dart';
import 'package:school_app/models/subject_model.dart';
import 'package:school_app/screens/edit_screen/edit_screen.dart';
import 'package:school_app/services/subjects_provider.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SubjectsProvider>(
      builder: (context, value, child) => FloatingActionButton(
        backgroundColor: AppColor.mainColor,
        onPressed: () {
          value.subjects.add(Subject(name: ""));
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  EditScreen(subjectIndex: value.subjects.length - 1)));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
