import 'package:flutter/material.dart';
import 'package:school_app/constants/app_colors.dart';
import 'package:school_app/constants/app_consts.dart';
import 'package:school_app/screens/edit_screen/components/edit_grade_dialog.dart';

class NumberIndicatorButton extends StatelessWidget {
  final int subjectIndex, listIndex, gradeIndex;
  final double number;
  const NumberIndicatorButton(
      {Key? key,
      required this.subjectIndex,
      required this.listIndex,
      required this.gradeIndex,
      required this.number})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          EditGradeDialog(context, subjectIndex, listIndex, gradeIndex),
      child: Container(
        height: 50,
        width: 50,
        margin: const EdgeInsets.only(right: 5),
        decoration: const BoxDecoration(
            color: AppColor.onBackgroundColor,
            borderRadius:
                BorderRadius.all(Radius.circular(AppConsts.cornerRadius))),
        child: Center(
          child: Text("$number"),
        ),
      ),
    );
  }
}
