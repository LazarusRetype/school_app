import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_app/constants/app_colors.dart';
import 'package:school_app/models/subject_model.dart';
import 'package:school_app/screens/homescreen/subjects_provider.dart';

class StatsBoard extends StatelessWidget {
  const StatsBoard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Subject> _subjects = Provider.of<SubjectsProvider>(context).subjects;

    List<Series<Subject, String>> series = List.generate(
      4,
      (index) => Series(
          id: index.toString(),
          data: _subjects,
          domainFn: (Subject s, _) => s.name,
          measureFn: (Subject s, _) => s.classTests[index].grade),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SizedBox(
        height: 200,
        width: double.infinity,
        child: Stack(
          fit: StackFit.loose,
          alignment: Alignment.center,
          clipBehavior: Clip.hardEdge,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: AppColor.onBackgroundColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.shadowColor,
                    blurRadius: 10,
                    spreadRadius: 1,
                    blurStyle: BlurStyle.normal,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200,
              child: BarChart(
                series,
                animate: false,
                barGroupingType: BarGroupingType.grouped,
              ),
            )
          ],
        ),
      ),
    );
  }
}
