import 'package:flutter/material.dart';
import 'package:flutter_app_beginner/pages/camera_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        home: ImagePickerWidget(),
      ),
    );
  }
}

