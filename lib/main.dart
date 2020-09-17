import 'package:covid19app1/utils/constants.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid-19 App',
      theme: ThemeData(
        primaryColor: KPrimaryColor,
        scaffoldBackgroundColor: KBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: KTextColor),
      ),
      home: HomeScreen(),
    );
  }
}