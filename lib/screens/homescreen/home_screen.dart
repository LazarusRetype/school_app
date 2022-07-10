import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_app/constants/app_colors.dart';
import 'package:school_app/constants/app_consts.dart';
import 'package:school_app/models/subject_model.dart';
import 'package:school_app/screens/edit_screen/edit_screen.dart';
import 'package:school_app/screens/homescreen/components/costume_app_bar.dart';
import 'package:school_app/services/subjects_provider.dart';
import 'package:school_app/screens/homescreen/components/subjects_tile_widget.dart';

import 'components/stats_boards.dart';

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
              CustomAppBar(
                  onPress: (() => value.addSubject(Subject(
                        name: getRandomString(5),
                        s: _rnd.nextDouble() * 100,
                        m: _rnd.nextDouble() * 100,
                      ))),
                  onPress2: (() => value.removeAll())),
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
          onPressed: () {
            value.subjects.add(Subject(name: ""));
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    EditScreen(subjectIndex: value.subjects.length)));
          },
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
