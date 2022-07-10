import 'package:flutter/material.dart';
import 'package:school_app/constants/app_consts.dart';
import 'package:school_app/models/grade_model.dart';
import 'package:school_app/screens/edit_screen/components/number_indicator_widget.dart';

class GradesList extends StatelessWidget {
  const GradesList({
    Key? key,
    required this.grades,
  }) : super(key: key);

  final List<Grade> grades;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: AppConsts.marginEdge),
      child: SizedBox(
        height: 50,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: grades.length,
            itemBuilder: (_, index) {
              return NumberIndicator(number: grades[index].grade);
            }),
      ),
    );
  }
}
