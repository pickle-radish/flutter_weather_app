// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'screen/loading.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather app',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Loading(),
    );
  }
}