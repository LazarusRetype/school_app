import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_app/models/subject_model.dart';
import 'package:school_app/services/convert.dart';

class SubjectTile extends StatelessWidget {
  Subject subject;
  SubjectTile(this.subject, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 10,
              spreadRadius: 1,
              blurStyle: BlurStyle.outer,
            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            // bottomRight: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(top: 10, left: 20, child: Text(subject.name)),
            Positioned(
              top: 40,
              left: 20,
              child: Text("s: ${Convert().listToString(subject.works)}"),
            ),
            Positioned(
              top: 80,
              left: 20,
              child: Text("m: ${Convert().listToString(subject.oralGrades)}"),
            ),
          ],
        ),
      ),
    );
  }
}
