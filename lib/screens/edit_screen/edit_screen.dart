import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:school_app/screens/edit_screen/components/edit_app_bar.dart';
import 'package:school_app/screens/edit_screen/components/edit_lists.dart';
import 'package:school_app/screens/edit_screen/components/submit_edit_button_widget.dart';
import 'package:school_app/services/subjects_provider.dart';
import 'package:school_app/screens/edit_screen/components/text_input_widget.dart';
import 'package:school_app/widgets/title_text.dart';

class EditScreen extends StatelessWidget {
  EditScreen({Key? key, required this.subjectIndex}) : super(key: key);
  final int subjectIndex;

  final TextEditingController mTextController = TextEditingController();
  final TextEditingController sTextController = TextEditingController();
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController classTestsTextController =
      TextEditingController();

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
              EditAppBar(title: value.subjects[subjectIndex].name),

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
              const TitleText(text: "Klassenarbeiten"),
              EditList(subjectIndex: subjectIndex, listIndex: 0),

              SubmitButton(
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
