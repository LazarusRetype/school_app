import 'package:flutter/material.dart';
import 'package:school_app/constants/app_colors.dart';

class StatsBoard extends StatelessWidget {
  const StatsBoard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Stack(
        children: [
          Container(
            height: 200,
            decoration: const BoxDecoration(
              color: AppColor.onBackgroundColor,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColor.shadowColor,
                  blurRadius: 10,
                  spreadRadius: 1,
                  blurStyle: BlurStyle.normal,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
