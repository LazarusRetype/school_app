import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_app/screens/homescreen/Homescreen.dart';
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
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
