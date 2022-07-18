import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:school_app/constants/app_colors.dart';
import 'package:school_app/constants/app_consts.dart';
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

              SizedBox(
                height: 500,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppConsts.marginEdge,
                      vertical: AppConsts.marginSmall),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount:
                        value.subjects[subjectIndex].gradeLists.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      if (index <
                          value.subjects[subjectIndex].gradeLists.length) {
                        return Column(
                          children: [
                            TitleText(
                                text: value.subjects[subjectIndex]
                                    .gradeListNames[index]),
                            EditList(
                                list: value
                                    .subjects[subjectIndex].gradeLists[index],
                                subjectIndex: subjectIndex,
                                listIndex: index),
                          ],
                        );
                      } else {
                        return GestureDetector(
                          onTap: () =>
                              value.addGradeList("servus", subjectIndex),
                          child: Container(
                            height: 50,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(AppConsts.cornerRadius)),
                                color: AppColor.onBackgroundColor,
                                boxShadow: [
                                  BoxShadow(
                                      color: AppColor.shadowColor,
                                      blurRadius: AppConsts.shadowBlur,
                                      spreadRadius: AppConsts.shadowSpread,
                                      offset: Offset(AppConsts.shadowOffset,
                                          AppConsts.shadowOffset))
                                ]),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),

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
