import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:school_app/constants/app_colors.dart';
import 'package:school_app/screens/homescreen/home_screen.dart';
import 'package:school_app/services/subjects_provider.dart';

void main() {
  debugRepaintRainbowEnabled = false;
  runApp(const MyApp());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SubjectsProvider>(
            create: (_) => SubjectsProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: AppColor.mainColor,
          textTheme: Theme.of(context).textTheme.apply(
                fontSizeDelta: 2,
                fontFamily: "Nunito",
              ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
