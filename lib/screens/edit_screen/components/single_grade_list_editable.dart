import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_app/constants/app_consts.dart';
import 'package:school_app/models/grade_model.dart';
import 'package:school_app/screens/edit_screen/components/edit_grade_dialog.dart';
import 'package:school_app/screens/edit_screen/components/number_indicator_button_widget.dart';
import 'package:school_app/services/subjects_provider.dart';

class EditableList extends StatelessWidget {
  const EditableList({
    Key? key,
    required this.list,
    required this.subjectIndex,
    required this.listIndex,
  }) : super(key: key);
  final List<Grade> list;
  final int subjectIndex, listIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.only(
          left: AppConsts.marginEdge, top: AppConsts.marginSmall),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index < list.length) {
            return NumberIndicatorButton(
                number: list[index].grade,
                gradeIndex: index,
                subjectIndex: subjectIndex,
                listIndex: listIndex);
          } else {
            return IconButton(
                onPressed: () {
                  Provider.of<SubjectsProvider>(context, listen: false)
                      .addGrade(subjectIndex, listIndex, Grade(1));
                  EditGradeDialog(context, subjectIndex, listIndex, index);
                },
                icon: const Icon(Icons.add));
          }
        },
      ),
    );
  }
}
