import 'package:flutter/material.dart';
import 'package:school_app/constants/app_consts.dart';
import 'package:school_app/widgets/app_bar_widget.dart';

class EditAppBar extends StatelessWidget {
  const EditAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

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
            title,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: AppConsts.fontSizeTitle),
          ),
        ],
      ),
    );
  }
}
