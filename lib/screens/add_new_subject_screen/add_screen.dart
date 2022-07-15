import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:school_app/constants/app_colors.dart';
import 'package:school_app/constants/app_consts.dart';
import 'package:school_app/models/grade_model.dart';
import 'package:school_app/models/subject_model.dart';
import 'package:school_app/screens/add_new_subject_screen/components/add_button.dart';
import 'package:school_app/screens/edit_screen/components/add_grade_widget.dart';
import 'package:school_app/screens/edit_screen/components/edit_app_bar.dart';
import 'package:school_app/screens/edit_screen/components/edit_lists.dart';
import 'package:school_app/screens/edit_screen/components/new_number_text_field_widget.dart';
import 'package:school_app/screens/edit_screen/components/number_indicator_widget.dart';
import 'package:school_app/screens/edit_screen/edit_screen.dart';
import 'package:school_app/screens/homescreen/home_screen.dart';
import 'package:school_app/services/subjects_provider.dart';
import 'package:school_app/widgets/app_bar_widget.dart';
import 'package:school_app/widgets/button_widget.dart';
import 'package:school_app/screens/edit_screen/components/text_input_widget.dart';
import 'package:school_app/widgets/title_text.dart';

class AddScreen extends StatelessWidget {
  AddScreen({Key? key, required this.subjectIndex}) : super(key: key);
  final int subjectIndex;

  var nameTextController = TextEditingController();

  var mTextController = TextEditingController();

  var sTextController = TextEditingController();

  var classTestsTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SubjectsProvider>(
        builder: (context, value, child) => Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //*Appbar
              const EditAppBar(title: "Neues Fach erstellen"),

              //*Settings
              const SizedBox(height: 30),

              CustomTextInput(
                  controller: nameTextController,
                  initialValue: value.subjects[subjectIndex].name,
                  lable: "Fächername",
                  maxLength: 20,
                  valitation: (text) => text == null || text.isEmpty
                      ? 'Bitte etwas eingeben'
                      : null),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: CustomTextInput(
                      controller: sTextController,
                      initialValue: value.subjects[subjectIndex].s.toString(),
                      lable: "schriftlich",
                      formater: [
                        FilteringTextInputFormatter.allow(RegExp(r"[0-9]"))
                      ],
                      inputType: TextInputType.number,
                      valitation: (text) => text == null || text.isEmpty
                          ? 'Bitte etwas eingeben'
                          : null,
                    ),
                  ),
                  const Text("/"),
                  Flexible(
                    child: CustomTextInput(
                      controller: mTextController,
                      initialValue: value.subjects[subjectIndex].m.toString(),
                      lable: "mündlich",
                      formater: [
                        FilteringTextInputFormatter.allow(RegExp(r"[0-9]"))
                      ],
                      inputType: TextInputType.number,
                      valitation: (text) => text == null || text.isEmpty
                          ? 'Bitte etwas eingeben'
                          : null,
                    ),
                  ),
                ],
              ),

              SubmitNewSubjectButton(
                  formKey: _formKey,
                  subjectIndex: subjectIndex,
                  nameTextController: nameTextController,
                  mTextController: mTextController,
                  sTextController: sTextController),
            ],
          ),
        ),
      ),
    );
  }
}
