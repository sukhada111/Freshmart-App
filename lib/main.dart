import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freshmart/screens/BestDeals.dart';
import 'package:freshmart/screens/aboutUs.dart';
import 'package:freshmart/screens/category.dart';
import 'package:freshmart/screens/home.dart';
import 'package:freshmart/screens/login.dart';
import 'package:freshmart/screens/myProfile.dart';
import 'package:freshmart/screens/register.dart';
import 'package:freshmart/screens/singleProduct.dart';
import 'package:freshmart/screens/welcome.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:freshmart/services/auth.dart';
import 'package:freshmart/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:freshmart/models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Freshmart());
}

class Freshmart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Users>.value(
      value: AuthService().user,
      child: MaterialApp(
        routes: {
          welcome_page.id: (context) => welcome_page(),
          Home.id: (context) => Home(),
          Login.id: (context) => Login(),
          Register.id: (context) => Register(),
          Category.id: (context) => Category(),
          MyProfile.id: (context) => MyProfile(),
          SingleProduct.id: (context) => SingleProduct(),
          BestDeals.id: (context) => BestDeals(),
          AboutUs.id: (context) => AboutUs(),




        },
        home: Wrapper(),
      ),
    );
  }
}
