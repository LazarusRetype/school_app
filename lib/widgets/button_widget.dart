import 'package:flutter/material.dart';
import 'package:school_app/constants/app_colors.dart';
import 'package:school_app/constants/app_consts.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({
    Key? key,
    required this.function,
    required this.lable,
  }) : super(key: key);

  final VoidCallback function;
  final String lable;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: function,
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width - AppConsts.marginEdge * 2,
          decoration: const BoxDecoration(
              color: AppColor.mainColor,
              borderRadius:
                  BorderRadius.all(Radius.circular(AppConsts.cornerRadius))),
          child: Center(child: Text(lable)),
        ));
  }
}
