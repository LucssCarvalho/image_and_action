import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_and_action/screens/SelectGameScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.blueGrey,
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'image and action',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SelectGame(),
    );
  }
}
