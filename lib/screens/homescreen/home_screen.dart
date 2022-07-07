import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_app/constants/app_colors.dart';
import 'package:school_app/models/grade_model.dart';
import 'package:school_app/models/subject_model.dart';
import 'package:school_app/screens/homescreen/subjects_provider.dart';
import 'package:school_app/screens/homescreen/subjects_tile.dart';

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
                    IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Title",
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
              Text("Stats"),
              Card(),
              Text("Subjects"),

              //* Subjects
              SizedBox(
                height: 2000,
                width: double.infinity,
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 3 / 2,
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 0),
                    itemCount: value.subjects.length,
                    itemBuilder: (_, index) =>
                        SubjectTile(value.subjects[index])),
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
