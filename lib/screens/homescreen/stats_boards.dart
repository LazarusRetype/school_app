import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_app/constants/app_consts.dart';
import 'package:school_app/models/subject_model.dart';
import 'package:school_app/widgets/stats_card_widget.dart';
import 'package:school_app/services/subjects_provider.dart';

class StatBoards extends StatelessWidget {
  const StatBoards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Subject> subjects = Provider.of<SubjectsProvider>(context).subjects;

    if (subjects.length > 4) {
      subjects = subjects.sublist(0, 4);
    }

    List<charts.Series<Subject, String>> series = List.generate(4, (index) {
      return charts.Series(
          id: index.toString(),
          data: subjects,
          domainFn: (Subject s, _) => s.name,
          measureFn: (Subject s, _) {
            return s.classTests.length > index ? s.classTests[index].grade : 0;
          });
    });

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          StatsCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(AppConsts.marginSmall),
                  child: Text("Top ${subjects.length} subjects",
                      style: const TextStyle(fontSize: 14)),
                ),
                SizedBox(
                  height: 180,
                  width: 338,
                  child: charts.BarChart(
                    series,
                    animate: false,
                    barGroupingType: charts.BarGroupingType.grouped,
                  ),
                ),
              ],
            ),
          ),
          StatsCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(AppConsts.marginSmall),
                  child: Text("Top ${subjects.length} subjects",
                      style: const TextStyle(fontSize: 14)),
                ),
                SizedBox(
                  height: 180,
                  width: 338,
                  child: charts.BarChart(
                    series,
                    animate: false,
                    barGroupingType: charts.BarGroupingType.grouped,
                  ),
                ),
              ],
            ),
          ),
          StatsCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(AppConsts.marginSmall),
                  child: Text("Top ${subjects.length} subjects",
                      style: const TextStyle(fontSize: 14)),
                ),
                SizedBox(
                  height: 180,
                  width: 338,
                  child: charts.BarChart(
                    series,
                    animate: false,
                    barGroupingType: charts.BarGroupingType.grouped,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
