import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_app/constants/app_colors.dart';
import 'package:school_app/constants/app_consts.dart';
import 'package:school_app/models/grade_model.dart';
import 'package:school_app/models/subject_model.dart';
import 'package:school_app/services/subjects_provider.dart';
import 'package:school_app/widgets/app_bar_widget.dart';
import 'package:school_app/widgets/new_number_text_field_widget.dart';
import 'package:school_app/widgets/number_indicator_widget.dart';

class DetailScreen extends StatelessWidget {
  final int indexOfSubject;
  DetailScreen(this.indexOfSubject, {Key? key}) : super(key: key);

  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SubjectsProvider>(builder: (context, value, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                  Text(
                    value.subjects[indexOfSubject].name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: AppConsts.fontSizeTitle),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                  left: AppConsts.marginEdge, top: AppConsts.marginAppBar),
              child: Text("Klassenarbieten"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: AppConsts.marginEdge),
              child: SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:
                      value.subjects[indexOfSubject].classTests.length + 1,
                  itemBuilder: (_, index) {
                    if (index <
                        value.subjects[indexOfSubject].classTests.length) {
                      if (value.subjects[indexOfSubject].classTests[index]
                              .grade ==
                          0) {
                        return NumberTextField(
                            controller: controller,
                            function: () => print("object"));
                      } else {
                        return NumberIndicator(
                            number: value.subjects[indexOfSubject]
                                .classTests[index].grade);
                      }
                    } else {
                      return IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          if (value.subjects[indexOfSubject].classTests
                                  .isEmpty ||
                              value.subjects[indexOfSubject]
                                      .classTests[index - 1].grade !=
                                  0) {
                            Provider.of<SubjectsProvider>(context,
                                    listen: false)
                                .addClassTest(
                                    value.subjects[indexOfSubject], Grade(0));
                          }
                        },
                      );
                    }
                  },
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                  left: AppConsts.marginEdge, top: AppConsts.marginBig),
              child: Text("Tests"),
            ),
            const Padding(
              padding: EdgeInsets.only(
                  left: AppConsts.marginEdge, top: AppConsts.marginBig),
              child: Text("Mündliche Noten"),
            ),
            const Padding(
              padding: EdgeInsets.only(
                  left: AppConsts.marginEdge, top: AppConsts.marginBig),
              child: Text("Präsentationen"),
            ),
          ],
        );
      }),
    );
  }
}
