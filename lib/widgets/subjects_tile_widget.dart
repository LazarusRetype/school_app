import 'package:flutter/material.dart';
import 'package:school_app/constants/app_colors.dart';
import 'package:school_app/models/subject_model.dart';
import 'package:school_app/screens/detail_screen.dart/detail_screen.dart';

class SubjectTile extends StatelessWidget {
  Subject subject;
  SubjectTile(this.subject, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: GestureDetector(
        onTap: (() => Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailScreen(subject)))),
        child: Container(
          height: 100,
          decoration: const BoxDecoration(
            color: AppColor.onBackgroundColor,
            boxShadow: [
              BoxShadow(
                color: AppColor.shadowColor,
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(top: 10, left: 20, child: Text(subject.name)),
            ],
          ),
        ),
      ),
    );
  }
}
