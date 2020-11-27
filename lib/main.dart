import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freshmart/screens/category.dart';
import 'package:freshmart/screens/login.dart';
import 'package:freshmart/screens/register.dart';

void main() => runApp(Freshmart());

class Freshmart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Register.id,
      routes: {
//        WelcomeScreen.id: (context) => WelcomeScreen(),
        Login.id: (context) => Login(),
        Register.id: (context) => Register(),
        Category.id: (context) => Category(),
      },
    );
  }
}
