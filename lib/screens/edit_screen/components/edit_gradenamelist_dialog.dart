import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_app/constants/app_colors.dart';
import 'package:school_app/constants/app_consts.dart';
import 'package:school_app/models/grade_model.dart';
import 'package:school_app/screens/edit_screen/components/text_input_widget.dart';
import 'package:school_app/services/subjects_provider.dart';

class EditGradeListNameDialog {
  EditGradeListNameDialog(
      BuildContext context, int subjectIndex, int listIndex) {
    var name = Provider.of<SubjectsProvider>(context, listen: false)
        .subjects[subjectIndex]
        .gradeListNames[listIndex];
    var controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: StatefulBuilder(
            builder: (context, setState) => Container(
              height: 150,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset:
                        Offset(AppConsts.shadowOffset, AppConsts.shadowOffset),
                    spreadRadius: AppConsts.shadowSpread,
                    color: AppColor.shadowColor,
                    blurRadius: AppConsts.shadowBlur,
                  )
                ],
                color: AppColor.onBackgroundColor,
                borderRadius:
                    BorderRadius.all(Radius.circular(AppConsts.cornerRadius)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(name.toString()),
                  CustomTextInput(
                      lable: "Namen Eingeben",
                      initialValue: name,
                      controller: controller,
                      valitation: (output) =>
                          output == "" ? "Bitte Etwas eingeben" : null)
                ],
              ),
            ),
          ),
        );
      },
    ).then((valueFromDialog) async {
      Provider.of<SubjectsProvider>(context, listen: false)
          .setGradeListName(controller.text, subjectIndex, listIndex);
    });
  }
}
