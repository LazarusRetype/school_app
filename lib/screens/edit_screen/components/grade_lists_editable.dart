import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_app/constants/app_colors.dart';
import 'package:school_app/constants/app_consts.dart';
import 'package:school_app/screens/edit_screen/components/edit_gradenamelist_dialog.dart';
import 'package:school_app/screens/edit_screen/components/edit_lists.dart';
import 'package:school_app/services/subjects_provider.dart';
import 'package:school_app/widgets/title_text.dart';

class GradeListsEditable extends StatelessWidget {
  const GradeListsEditable({
    Key? key,
    required this.subjectIndex,
  }) : super(key: key);

  final int subjectIndex;

  @override
  Widget build(BuildContext context) {
    return Consumer<SubjectsProvider>(
      builder: (context, value, child) => SizedBox(
        height: 500,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConsts.marginEdge,
              vertical: AppConsts.marginSmall),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: value.subjects[subjectIndex].gradeLists.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index < value.subjects[subjectIndex].gradeLists.length) {
                return Column(
                  children: [
                    //* Grade List Title with editable dialog
                    GestureDetector(
                      onTap: () =>
                          EditGradeListNameDialog(context, subjectIndex, index),
                      child: TitleText(
                          text: value
                              .subjects[subjectIndex].gradeListNames[index]),
                    ),

                    //* The Grade List editable
                    EditableList(
                        list: value.subjects[subjectIndex].gradeLists[index],
                        subjectIndex: subjectIndex,
                        listIndex: index),
                  ],
                );
              } else {
                //* add New List Button
                return GestureDetector(
                  onTap: () {
                    value.addGradeList("", subjectIndex);
                    EditGradeListNameDialog(context, subjectIndex, index);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: AppConsts.marginSmall),
                    height: 50,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(AppConsts.cornerRadius)),
                        color: AppColor.onBackgroundColor,
                        boxShadow: [
                          BoxShadow(
                              color: AppColor.shadowColor,
                              blurRadius: AppConsts.shadowBlur,
                              spreadRadius: AppConsts.shadowSpread,
                              offset: Offset(AppConsts.shadowOffset,
                                  AppConsts.shadowOffset))
                        ]),
                    child: const Icon(Icons.add),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
