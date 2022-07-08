import 'package:flutter/material.dart';
import 'package:school_app/constants/app_consts.dart';
import 'package:school_app/models/subject_model.dart';
import 'package:school_app/widgets/app_bar_widget.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Subject newSubject = Subject(
        name: "",
        classTests: [],
        oralGrades: [],
        presentations: [],
        shortTests: []);
    return Scaffold(
      body: Column(
        children: [
          //*Appbar
          CustomeAppBar(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: (() => Navigator.of(context).pop()),
                    icon: const Icon(Icons.arrow_back)),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width / 2 - 70),
                  child: const Text(
                    "Add new Subject",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),

          //*Settings
          Padding(
            padding: const EdgeInsets.only(
                left: AppConsts.edgeMargin,
                right: AppConsts.edgeMargin,
                top: AppConsts.topAfterAppBarMargin),
            child: TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(AppConsts.cornerRadius))),
                  labelText: "enter a subject name"),
            ),
          )
        ],
      ),
    );
  }
}
