import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_app/constants/app_colors.dart';
import 'package:school_app/constants/app_consts.dart';
import 'package:school_app/models/subject_model.dart';
import 'package:school_app/screens/detail_screen.dart/detail_screen.dart';
import 'package:school_app/services/subjects_provider.dart';

class SubjectTile extends StatelessWidget {
  final Subject subject;
  const SubjectTile(this.subject, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: GestureDetector(
        onTap: (() => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailScreen(
                    Provider.of<SubjectsProvider>(context)
                        .subjects
                        .indexOf(subject))))),
        child: Container(
          height: 100,
          decoration: const BoxDecoration(
            color: AppColor.onBackgroundColor,
            boxShadow: [
              BoxShadow(
                color: AppColor.shadowColor,
                blurRadius: AppConsts.shadowBlur,
                spreadRadius: AppConsts.shadowSpread,
                offset: Offset(AppConsts.shadowOffset, AppConsts.shadowOffset),
              ),
            ],
            borderRadius: BorderRadius.all(
              Radius.circular(AppConsts.cornerRadius),
            ),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                  top: 10,
                  left: 20,
                  child: Hero(
                      tag: subject.name,
                      child: Material(
                          color: Colors.transparent,
                          child: Text(subject.name)))),
            ],
          ),
        ),
      ),
    );
  }
}
