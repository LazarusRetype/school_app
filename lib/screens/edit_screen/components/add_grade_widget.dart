import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_app/constants/app_colors.dart';
import 'package:school_app/constants/app_consts.dart';
import 'package:school_app/models/grade_model.dart';
import 'package:school_app/screens/edit_screen/components/edit_grade_dialog.dart';
import 'package:school_app/services/subjects_provider.dart';

class AddGradeButton extends StatelessWidget {
  const AddGradeButton({
    Key? key,
    required this.subjectIndex,
    required this.listIndex,
    required this.gradeIndex,
  }) : super(key: key);

  final int subjectIndex;
  final int listIndex;
  final int gradeIndex;

  @override
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Provider.of<SubjectsProvider>(context, listen: false)
              .addGrade(subjectIndex, listIndex, Grade(1));
          EditGradeDialog(context, subjectIndex, listIndex, gradeIndex);
        },
        icon: const Icon(Icons.add));
  }
}
