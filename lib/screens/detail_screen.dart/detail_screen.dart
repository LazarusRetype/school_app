import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_app/constants/app_consts.dart';
import 'package:school_app/models/grade_model.dart';
import 'package:school_app/screens/detail_screen.dart/components/details_app_bar.dart';
import 'package:school_app/screens/detail_screen.dart/components/grade_list.dart';
import 'package:school_app/services/subjects_provider.dart';

class DetailScreen extends StatelessWidget {
  final int subjectIndex;
  DetailScreen(this.subjectIndex, {Key? key}) : super(key: key);

  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SubjectsProvider>(builder: (context, value, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailAppBar(
              subject: value.subjects[subjectIndex].name,
              indexOfSubject: subjectIndex,
            ),
            Padding(
              padding: const EdgeInsets.only(top: AppConsts.marginAppBar),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      "s/m: ${value.subjects[subjectIndex].s}/${value.subjects[subjectIndex].m}"),
                ],
              ),
            ),
            Column(
              children: [
                for (var i = 0;
                    i < value.subjects[subjectIndex].gradeLists.length;
                    i++)
                  Column(
                    children: [
                      Text(value.subjects[subjectIndex].gradeListNames[i]),
                      GradesList(
                        list: value.subjects[subjectIndex].gradeLists[i],
                        subjectIndex: subjectIndex,
                        listIndex: i,
                      ),
                    ],
                  )
              ],
            )
          ],
        );
      }),
    );
  }
}
