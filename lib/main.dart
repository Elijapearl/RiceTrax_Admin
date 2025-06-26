import 'package:flutter/material.dart';
import 'signup.dart ';

void main() {
  runApp(RiceTraxApp());
}

class RiceTraxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUpScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}