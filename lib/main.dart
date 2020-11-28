import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freshmart/screens/category.dart';
import 'package:freshmart/screens/login.dart';
import 'package:freshmart/screens/register.dart';
import 'package:freshmart/screens/welcome.dart';
import '';

void main() => runApp(MaterialApp(home: Freshmart(),));

class Freshmart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Register.id,
      routes: {
        welcome_page.id: (context) => welcome_page(),
        Login.id: (context) => Login(),
        Register.id: (context) => Register(),
        Category.id: (context) => Category(),
      },
    );
  }
}
