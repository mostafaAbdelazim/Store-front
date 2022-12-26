import 'package:flutter/material.dart';
import 'package:task/constants/constants.dart';
import 'package:task/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: kAccentColor, primary: kPrimaryColor)),
      debugShowCheckedModeBanner: false,
      home: const Directionality(
          textDirection: TextDirection.rtl, child: HomeScreen()),
    );
  }
}
