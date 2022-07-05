import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:school_app/screens/homescreen/subjects_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SubjectsProvider>(
        builder: (context, value, child) => ListView.builder(
          itemCount: value.subjects.length,
          itemBuilder: (_, index) => ListTile(
            title: Text(value.subjects[index].name),
          ),
        ),
      ),
    );
  }
}
