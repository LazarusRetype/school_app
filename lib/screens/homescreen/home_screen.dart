import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_app/constants/app_colors.dart';
import 'package:school_app/models/grade_model.dart';
import 'package:school_app/models/subject_model.dart';
import 'package:school_app/screens/homescreen/subjects_provider.dart';
import 'package:school_app/screens/homescreen/subjects_tile.dart';

import 'stats_board_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

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
                      onPressed: () {
                        value.removeAll();
                      },
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
              name: getRandomString(5),
              s: _rnd.nextDouble() * 100,
              m: _rnd.nextDouble() * 100,
              classTests:
                  List.generate(4, (index) => Grade(_rnd.nextInt(6) + 1)),
              oralGrades: List.generate(
                  _rnd.nextInt(10), (index) => Grade(_rnd.nextInt(6) + 1)),
              shortTests: List.generate(
                  _rnd.nextInt(10), (index) => Grade(_rnd.nextInt(6) + 1)),
              presentations: List.generate(
                _rnd.nextInt(10),
                (index) => Grade(_rnd.nextInt(5) + 1),
              )))),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  final _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}
