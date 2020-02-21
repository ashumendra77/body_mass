import 'package:flutter/material.dart';
import './second.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: bmi(),
      debugShowCheckedModeBanner: false,
      
    );
  }
}