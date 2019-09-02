import 'package:flutter/material.dart';
import 'package:Flutter_Music/pages/bottomNavigationWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '防网易云音乐',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: BottomNavigationWidget(),
    );
  }
}
