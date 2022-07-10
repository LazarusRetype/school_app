import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:school_app/constants/app_consts.dart';
import 'package:school_app/models/subject_model.dart';
import 'package:school_app/screens/edit_screen/components/edit_app_bar.dart';
import 'package:school_app/screens/homescreen/home_screen.dart';
import 'package:school_app/services/subjects_provider.dart';
import 'package:school_app/widgets/app_bar_widget.dart';
import 'package:school_app/widgets/button_widget.dart';
import 'package:school_app/screens/edit_screen/components/text_input_widget.dart';

class EditScreen extends StatelessWidget {
  EditScreen({Key? key, required this.subjectIndex}) : super(key: key);
  final int subjectIndex;
  var nameTextController = TextEditingController();

  var mTextController = TextEditingController();

  var sTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SubjectsProvider>(
        builder: (context, value, child) => Form(
          key: _formKey,
          child: Column(
            children: [
              //*Appbar
              EditAppBar(
                  title: value.subjects[subjectIndex].name == ""
                      ? "Neues Fach erstellen"
                      : value.subjects[subjectIndex].name),

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
                children: [
                  Text("schriftlich/mündlich: "),
                  Flexible(
                    child: CustomTextInput(
                      controller: sTextController,
                      initialValue: value.subjects[subjectIndex].s.toString(),
                      lable: "s",
                      formater: [
                        FilteringTextInputFormatter.allow(RegExp(r"[0-9]"))
                      ],
                      inputType: TextInputType.number,
                      valitation: (text) => text == null || text.isEmpty
                          ? 'Bitte etwas eingeben'
                          : null,
                    ),
                  ),
                  Flexible(
                    child: CustomTextInput(
                      controller: mTextController,
                      initialValue: value.subjects[subjectIndex].m.toString(),
                      lable: "m",
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
              CustomButtom(
                function: () {
                  if (_formKey.currentState!.validate()) {
                    value.changeSubject(
                        subjectIndex,
                        Subject(
                            name: nameTextController.text,
                            m: double.parse(mTextController.text == ""
                                ? "1"
                                : mTextController.text),
                            s: double.parse(sTextController.text == ""
                                ? "1"
                                : sTextController.text)));
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => HomeScreen()));
                  }
                },
                lable: value.subjects[subjectIndex].name == ""
                    ? "Hinzufügen"
                    : "Bearbeiten",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
