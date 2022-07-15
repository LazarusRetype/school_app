import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_app/constants/app_consts.dart';
import 'package:school_app/models/grade_model.dart';
import 'package:school_app/screens/edit_screen/components/add_grade_widget.dart';
import 'package:school_app/screens/edit_screen/components/number_indicator_widget.dart';
import 'package:school_app/services/subjects_provider.dart';

class EditList extends StatelessWidget {
  const EditList({
    Key? key,
    required this.subjectIndex,
    required this.listIndex,
  }) : super(key: key);
  final int subjectIndex, listIndex;

  @override
  Widget build(BuildContext context) {
    List<Grade> list = Provider.of<SubjectsProvider>(context)
        .subjects[subjectIndex]
        .gradeLists[listIndex];

    return Container(
      height: 50,
      padding: const EdgeInsets.only(
          left: AppConsts.marginEdge, top: AppConsts.marginSmall),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index < list.length) {
            return NumberIndicator(number: list[index].grade);
          } else {
            return AddGradeButton(
                listIndex: listIndex, subjectIndex: subjectIndex);
          }
        },
      ),
    );
  }
}
