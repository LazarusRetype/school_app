import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_app/constants/app_colors.dart';
import 'package:school_app/constants/app_consts.dart';
import 'package:school_app/models/grade_model.dart';
import 'package:school_app/models/subject_model.dart';
import 'package:school_app/screens/add_screen.dart/add_screen.dart';
import 'package:school_app/screens/homescreen/subjects_provider.dart';
import 'package:school_app/widgets/app_bar_widget.dart';
import 'package:school_app/widgets/subjects_tile_widget.dart';

import 'stats_boards.dart';

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
              CustomeAppBar(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: (() => value.addSubject(Subject(
                            name: getRandomString(5),
                            s: _rnd.nextDouble() * 100,
                            m: _rnd.nextDouble() * 100,
                            classTests: List.generate(
                                4, (index) => Grade(_rnd.nextInt(6) + 1)),
                            oralGrades: List.generate(_rnd.nextInt(10),
                                (index) => Grade(_rnd.nextInt(6) + 1)),
                            shortTests: List.generate(_rnd.nextInt(10),
                                (index) => Grade(_rnd.nextInt(6) + 1)),
                            presentations: List.generate(
                              _rnd.nextInt(10),
                              (index) => Grade(_rnd.nextInt(5) + 1),
                            )))),
                        icon: const Icon(Icons.search)),
                    const Padding(
                      padding: EdgeInsets.only(left: AppConsts.marginSmall),
                      child: Text(
                        "Dashboard",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: AppConsts.fontSizeTitle),
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
                padding: EdgeInsets.only(
                    left: AppConsts.marginEdge,
                    top: AppConsts.marginAppBar,
                    bottom: AppConsts.marginSmall),
                child: Text("Stats"),
              ),

              const StatBoards(),

              const Padding(
                padding: EdgeInsets.only(
                    left: AppConsts.marginEdge,
                    top: AppConsts.marginBig,
                    bottom: AppConsts.marginSmall),
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
          backgroundColor: AppColor.mainColor,
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const AddScreen())),
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
