import 'package:flutter/material.dart';

import 'Dashboard.dart'; // If you want to route to login first

void main() {
  runApp(RiceTraxApp());
}

class RiceTraxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Dashboard(), // Change this to LoginPage() if needed
      debugShowCheckedModeBanner: false,
    );
  }
}
