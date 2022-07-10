import 'package:flutter/material.dart';
import 'package:school_app/constants/app_consts.dart';
import 'package:school_app/widgets/app_bar_widget.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.onPress, required this.onPress2})
      : super(key: key);

  final VoidCallback onPress, onPress2;

  @override
  Widget build(BuildContext context) {
    return CustomeAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: onPress, icon: const Icon(Icons.search)),
          const Padding(
            padding: EdgeInsets.only(left: AppConsts.marginSmall),
            child: Text(
              "Dashboard",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: AppConsts.fontSizeTitle),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.account_circle_rounded),
            onPressed: onPress2,
          ),
        ],
      ),
    );
  }
}
