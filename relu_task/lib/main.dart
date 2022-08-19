import 'package:flutter/material.dart';
import 'package:relu_task/screens/home.dart';
import 'package:relu_task/screens/track_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {'track_details':(context) => const TrackDetails()},
      theme: ThemeData.dark(),
      home: Home(),
    );
  }
}
