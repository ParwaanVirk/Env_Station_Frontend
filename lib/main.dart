import 'package:flutter/material.dart';
import 'package:env_station/screens/whether.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WhetherPage(),
    );
  }
}
