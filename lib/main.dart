import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freshmart/screens/category.dart';
import 'package:freshmart/screens/login.dart';
import 'package:freshmart/screens/register.dart';
import 'package:freshmart/screens/welcome.dart';

<<<<<<< HEAD
void main() => runApp(MaterialApp(home: Freshmart(),));
=======
void main() => runApp(Freshmart());
>>>>>>> 28189283a45457f687a92d308197420b692b7f67

class Freshmart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: welcome_page.id,
      routes: {
        welcome_page.id: (context) => welcome_page(),
        Login.id: (context) => Login(),
        Register.id: (context) => Register(),
        Category.id: (context) => Category(),
      },
    );
  }
}
