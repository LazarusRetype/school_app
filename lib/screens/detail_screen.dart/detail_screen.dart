import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_app/screens/detail_screen.dart/components/details_app_bar.dart';
import 'package:school_app/screens/detail_screen.dart/components/grade_list.dart';
import 'package:school_app/services/subjects_provider.dart';
import 'package:school_app/widgets/title_text.dart';

class DetailScreen extends StatelessWidget {
  final int indexOfSubject;
  DetailScreen(this.indexOfSubject, {Key? key}) : super(key: key);

  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SubjectsProvider>(builder: (context, value, child) {
        if (value.subjects[indexOfSubject] != null) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailAppBar(
                subject: value.subjects[indexOfSubject].name,
                indexOfSubject: indexOfSubject,
              ),
            ],
          );
        } else {
          return const CircularProgressIndicator();
        }
      }),
    );
  }
}
