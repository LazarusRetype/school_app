import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:school_app/constants/app_consts.dart';
import 'package:school_app/screens/homescreen/components/subjects_tile_widget.dart';
import 'package:school_app/services/subjects_provider.dart';

class SubjectList extends StatelessWidget {
  const SubjectList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SubjectsProvider>(
      builder: (context, value, child) => Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(
                left: AppConsts.marginEdge,
                top: AppConsts.marginBig,
                bottom: AppConsts.marginSmall),
            child: Text("Subjects"),
          ),
          Column(
            children: <Widget>[
              ...value.subjects.map((e) => SubjectTile(e)).toList()
            ],
          ),
        ],
      ),
    );
  }
}
