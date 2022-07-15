import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_app/constants/app_colors.dart';
import 'package:school_app/constants/app_consts.dart';
import 'package:school_app/services/subjects_provider.dart';

class AddGradeButton extends StatelessWidget {
  const AddGradeButton({
    Key? key,
    required this.subjectIndex,
    required this.listIndex,
  }) : super(key: key);

  final int subjectIndex;
  final int listIndex;

  @override
  Widget build(BuildContext context) {
    return Consumer<SubjectsProvider>(
      builder: (context, value, child) => IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                var lastGrade = value
                    .subjects[subjectIndex]
                    .gradeLists[listIndex][value
                        .subjects[subjectIndex].gradeLists[listIndex].length]
                    .grade;
                return Dialog(
                  backgroundColor: Colors.transparent,
                  child: Container(
                    height: 200,
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(
                              AppConsts.shadowOffset, AppConsts.shadowOffset),
                          spreadRadius: AppConsts.shadowSpread,
                          color: AppColor.shadowColor,
                          blurRadius: AppConsts.shadowBlur,
                        )
                      ],
                      color: Colors.green,
                      borderRadius: BorderRadius.all(
                          Radius.circular(AppConsts.cornerRadius)),
                    ),
                    child: Slider(
                      value: lastGrade,
                      onChanged: (double grade) {
                        lastGrade = grade.toInt().toDouble();
                      },
                      min: 1,
                      max: 6,
                    ),
                  ),
                );
              },
            ).then((valueFromDialog) {});
          },
          icon: const Icon(Icons.add)),
    );
  }
}
