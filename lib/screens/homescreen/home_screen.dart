import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_app/constants/app_colors.dart';
import 'package:school_app/constants/app_consts.dart';
import 'package:school_app/screens/homescreen/components/costume_app_bar.dart';
import 'package:school_app/screens/homescreen/components/floating_button.dart';
import 'package:school_app/screens/homescreen/components/subjects_list.dart';
import 'package:school_app/services/localsave.dart';
import 'package:school_app/services/subjects_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
            //* App Bar
            CustomAppBar(
                onPress: (() {
                  LocalSave.removeAll();
                  print("all deleted");
                }),
                onPress2: (() {})),
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
