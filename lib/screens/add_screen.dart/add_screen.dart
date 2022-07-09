import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:school_app/constants/app_colors.dart';
import 'package:school_app/constants/app_consts.dart';
import 'package:school_app/models/grade_model.dart';
import 'package:school_app/models/subject_model.dart';
import 'package:school_app/services/subjects_provider.dart';
import 'package:school_app/widgets/app_bar_widget.dart';
import 'package:school_app/widgets/button_widget.dart';
import 'package:school_app/widgets/text_input_widget.dart';

class AddScreen extends StatefulWidget {
  AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  var nameTextController = TextEditingController();

  var mTextController = TextEditingController();

  var sTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            //*Appbar
            CustomeAppBar(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 0,
                    child: IconButton(
                        onPressed: (() => Navigator.of(context).pop()),
                        icon: const Icon(Icons.arrow_back)),
                  ),
                  const Text(
                    "Neues Fach",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: AppConsts.fontSizeTitle),
                  ),
                ],
              ),
            ),

            //*Settings
            const SizedBox(height: 30),
            CustomTextInput(
              controller: nameTextController,
              lable: "Fächername",
              maxLength: 20,
              valitation: (text) =>
                  text == null || text.isEmpty ? 'Bitte etwas eingeben' : null,
            ),
            Row(
              children: [
                Flexible(
                  child: CustomTextInput(
                    controller: sTextController,
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
                Flexible(
                  child: CustomTextInput(
                    controller: mTextController,
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
            CustomButtom(
              function: () {
                if (_formKey.currentState!.validate()) {
                  Provider.of<SubjectsProvider>(context, listen: false)
                      .addSubject(Subject(
                          name: nameTextController.text,
                          m: double.parse(mTextController.text == ""
                              ? "1"
                              : mTextController.text),
                          s: double.parse(sTextController.text == ""
                              ? "1"
                              : sTextController.text)));
                  Navigator.pop(context);
                }
              },
              lable: 'Hinzufügen',
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameTextController.dispose();
    sTextController.dispose();
    mTextController.dispose();
    super.dispose();
  }
}
