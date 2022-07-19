import 'package:flutter/material.dart';
import 'package:school_app/constants/app_consts.dart';
import 'package:school_app/models/grade_model.dart';
import 'package:school_app/screens/detail_screen.dart/components/number_indicator_widget.dart';

class GradesList extends StatelessWidget {
  const GradesList({
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
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return NumberIndicator(
            number: list[index].grade,
          );
        },
      ),
    );
  }
}
