import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_app/constants/app_colors.dart';
import 'package:school_app/models/grade_model.dart';
import 'package:school_app/models/subject_model.dart';
import 'package:school_app/screens/homescreen/subjects_provider.dart';
import 'package:school_app/screens/homescreen/subjects_tile.dart';

import 'stats_board_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SubjectsProvider>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //* AppBar
              Container(
                height: 60,
                decoration: const BoxDecoration(
                  color: AppColor.maintColor,
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.shadowColor,
                      spreadRadius: 1,
                      blurRadius: 10,
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.search)),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Dashboard",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.account_circle_rounded),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 30, bottom: 15),
                child: Text("Stats"),
              ),
              const StatsBoard(),

              const SizedBox(height: 20),

              const Padding(
                padding: EdgeInsets.only(left: 20, top: 30, bottom: 15),
                child: Text("Subjects"),
              ),
              Column(
                children: <Widget>[
                  ...value.subjects.map((e) => SubjectTile(e)).toList()
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (() => value.addSubject(Subject(
              name: "Mathe",
              s: 5,
              m: 4,
              classTests: [Grade(2), Grade(2), Grade(2)],
              oralGrades: [Grade(2), Grade(2), Grade(2), Grade(2)],
              shortTests: [Grade(2), Grade(2)],
              presentations: [Grade(2)]))),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
