import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ngicon_task/screen/add_project.dart';
import 'package:ngicon_task/screen/details_page.dart';

import 'package:ngicon_task/screen/login_form.dart';
import 'package:ngicon_task/utls/const.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        iconTheme: IconThemeData(color: kLabel),
        hintColor: kLabel,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(backgroundColor: kMain2)),
        appBarTheme: AppBarTheme(backgroundColor: kMain),
        scaffoldBackgroundColor: kMain,
        textTheme: TextTheme(
            bodyText2: TextStyle(color: kLabel),
            bodyText1: TextStyle(color: kLabel),
            subtitle1: TextStyle(color: kLabel)
            // titleLarge: TextStyle(color: Colors.white),
            // subtitle1: TextStyle(color: kLabel),
            // subtitle2: TextStyle(color: kLabel),
            ),
        inputDecorationTheme: InputDecorationTheme(
          iconColor: kLabel,
          // constraints: BoxConstraints(minHeight: 50),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ksystemGrey),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kSpaceGray),
              borderRadius: BorderRadius.circular(10)),
        ),
        checkboxTheme: CheckboxThemeData(
            fillColor: MaterialStateProperty.all(ksystemGrey)),
      ),
      home: DetailsScreen(),
    );
  }
}
