import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 60,
        decoration: const BoxDecoration(
          color: AppColor.mainColor,
          boxShadow: [
            BoxShadow(
              color: AppColor.shadowColor,
              spreadRadius: 1,
              blurRadius: 10,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
                onPressed: (() => Navigator.of(context).pop()),
                icon: const Icon(Icons.arrow_back)),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width / 2 - 70),
              child: const Text(
                "Add new Subject",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
