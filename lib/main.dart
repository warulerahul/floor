import 'package:floor_demo/dao/dog.dart';
import 'package:flutter/material.dart';

import 'package:floor_demo/MyHomePage.dart';
import 'package:floor_demo/MyHomePage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

