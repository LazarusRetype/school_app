import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_app/constants/app_colors.dart';
import 'package:school_app/constants/app_consts.dart';
import 'package:school_app/models/subject_model.dart';
import 'package:school_app/screens/edit_screen/edit_screen.dart';
import 'package:school_app/screens/homescreen/components/costume_app_bar.dart';
import 'package:school_app/screens/homescreen/components/floating_button.dart';
import 'package:school_app/screens/homescreen/components/subjects_list.dart';
import 'package:school_app/services/subjects_provider.dart';
import 'package:school_app/screens/homescreen/components/subjects_tile_widget.dart';

import 'components/stats_boards.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //* AppBar
            CustomAppBar(onPress: (() {}), onPress2: (() {})),
            const Padding(
              padding: EdgeInsets.only(
                  left: AppConsts.marginEdge,
                  top: AppConsts.marginAppBar,
                  bottom: AppConsts.marginSmall),
              child: Text("Stats"),
            ),

            //const StatBoards(), //TODO make stats

            const SubjectList(),
          ],
        ),
      ),
      floatingActionButton: const FloatingButton(),
    );
  }
}
