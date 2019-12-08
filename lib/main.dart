import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int number = 1;
    while (100 >= number) {
      print(number);
      number++;
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Dart 学习"),
        ),
      ),
    );
  }
}
