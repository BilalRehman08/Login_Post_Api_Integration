import 'package:flutter/material.dart';
import 'package:task/screens/auth/login/login.dart';
import 'package:task/utils/constants.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appTitle,
      home: Login(),
    );
  }
}
