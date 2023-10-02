import 'package:flutter/material.dart';
import 'package:uts2/View/add_data.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AddData(),
    );
  }
}
