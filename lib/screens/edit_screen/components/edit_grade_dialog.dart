import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_app/constants/app_colors.dart';
import 'package:school_app/constants/app_consts.dart';
import 'package:school_app/models/grade_model.dart';
import 'package:school_app/services/subjects_provider.dart';

class EditGradeDialog {
  EditGradeDialog(
      BuildContext context, int subjectIndex, listIndex, gradeIndex) {
    var gradeInList = Provider.of<SubjectsProvider>(context, listen: false)
        .subjects[subjectIndex]
        .gradeLists[listIndex][gradeIndex]
        .grade;
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: StatefulBuilder(
            builder: (context, setState) => Container(
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
                  borderRadius:
                      BorderRadius.all(Radius.circular(AppConsts.cornerRadius)),
                ),
                child: Column(
                  children: [
                    Text(gradeInList.toString()),
                    Slider(
                      value: gradeInList,
                      onChanged: (double newGrade) {
                        setState(() {
                          gradeInList = newGrade;
                          Provider.of<SubjectsProvider>(context, listen: false)
                              .setGrade(subjectIndex, listIndex, gradeIndex,
                                  Grade(gradeInList));
                        });
                      },
                      min: 1,
                      max: 6,
                    ),
                  ],
                )),
          ),
        );
      },
    ).then((valueFromDialog) {});
  }
}
