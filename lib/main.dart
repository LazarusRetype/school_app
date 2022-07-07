import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_app/screens/homescreen/home_screen.dart';
import 'package:school_app/screens/homescreen/subjects_provider.dart';

void main() {
  runApp(const MyApp());
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
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(
              fontSizeDelta: 2,
              fontFamily: "Nunito",
              decorationStyle: TextDecorationStyle.solid),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
