import 'package:flutter/material.dart';
import 'package:school_app/constants/app_colors.dart';
import 'package:school_app/constants/app_consts.dart';

class StatsCard extends StatelessWidget {
  final Widget child;
  const StatsCard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: SizedBox(
        height: 220,
        width: 300,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: AppColor.onBackgroundColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(AppConsts.cornerRadius),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.shadowColor,
                    blurRadius: AppConsts.shadowBlur,
                    spreadRadius: AppConsts.shadowSpread,
                    blurStyle: BlurStyle.normal,
                    offset:
                        Offset(AppConsts.shadowOffset, AppConsts.shadowOffset),
                  ),
                ],
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
