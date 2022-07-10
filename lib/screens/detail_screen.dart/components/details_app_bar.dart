import 'package:flutter/material.dart';
import 'package:school_app/constants/app_consts.dart';
import 'package:school_app/screens/edit_screen/edit_screen.dart';
import 'package:school_app/widgets/app_bar_widget.dart';

class DetailAppBar extends StatelessWidget {
  const DetailAppBar({
    Key? key,
    required this.subject,
    required this.indexOfSubject,
  }) : super(key: key);

  final String subject;
  final int indexOfSubject;

  @override
  Widget build(BuildContext context) {
    return CustomeAppBar(
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
            subject,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: AppConsts.fontSizeTitle),
          ),
          Positioned(
            right: 0,
            child: PopupMenuButton(
              icon: const Icon(Icons.more_vert),
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                PopupMenuItem(
                  child: ListTile(
                    leading: const Icon(Icons.edit),
                    title: const Text('Fach bearbeiten'),
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) =>
                            EditScreen(subjectIndex: indexOfSubject))),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
