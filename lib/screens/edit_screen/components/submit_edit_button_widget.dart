import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_app/models/subject_model.dart';
import 'package:school_app/screens/homescreen/home_screen.dart';
import 'package:school_app/services/subjects_provider.dart';
import 'package:school_app/widgets/button_widget.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.subjectIndex,
    required this.nameTextController,
    required this.mTextController,
    required this.sTextController,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final int subjectIndex;
  final TextEditingController nameTextController;
  final TextEditingController mTextController;
  final TextEditingController sTextController;

  @override
  Widget build(BuildContext context) {
    return CustomButtom(
      function: () {
        if (_formKey.currentState!.validate()) {
          Provider.of<SubjectsProvider>(context, listen: false).changeSubject(
              subjectIndex,
              Subject(
                  name: nameTextController.text,
                  m: double.parse(
                      mTextController.text == "" ? "1" : mTextController.text),
                  s: double.parse(sTextController.text == ""
                      ? "1"
                      : sTextController.text)));
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));
        }
      },
      lable: "Bearbeiten",
    );
  }
}
