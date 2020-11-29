import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freshmart/models/user.dart';
import 'package:freshmart/screens/category.dart';
import 'package:freshmart/screens/welcome.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users>(context);

    // return either the Home or Authenticate widget
    if (user == null) {
      return welcome_page();
    } else {
      return Category();
    }
  }
}
