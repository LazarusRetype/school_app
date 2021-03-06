import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:school_app/constants/app_colors.dart';
import 'package:school_app/constants/app_consts.dart';
import 'package:school_app/screens/edit_screen/components/edit_app_bar.dart';
import 'package:school_app/screens/edit_screen/components/single_grade_list_editable.dart';
import 'package:school_app/screens/edit_screen/components/grade_lists_editable.dart';
import 'package:school_app/screens/edit_screen/components/submit_edit_button.dart';
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
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
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

                //* Raw text inputs
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

                GradeListsEditable(subjectIndex: subjectIndex),

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
      ),
    );
  }
}
