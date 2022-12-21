import 'package:flutter/material.dart';
import 'package:sfpracexam/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Practical Exam - Semi Final',
    theme: ThemeData(
      primarySwatch: Colors.brown
    ),
    home: Home(),
  ));
}