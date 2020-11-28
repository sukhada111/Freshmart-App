import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freshmart/screens/category.dart';
import 'package:freshmart/screens/login.dart';
import 'package:freshmart/screens/register.dart';

<<<<<<< HEAD
void main() {
  runApp(MaterialApp(
      home:welcome_page()
  ),
  );
=======
class welcome_page extends StatefulWidget {
  static const String id = 'welcome_page';

  @override
  _welcome_pageState createState() => _welcome_pageState();
>>>>>>> 28189283a45457f687a92d308197420b692b7f67
}

class _welcome_pageState extends State<welcome_page> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              "Freshmart",
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(100, 20, 100, 10),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 90,
                          backgroundColor: Colors.black,
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/logo-black.png"),
                            radius: 90,
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ],
                    )),
                Container(
                  padding: EdgeInsets.fromLTRB(80, 40, 80, 20),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                        child: Text(
                          "Welcome to Freshmart!",
                          style:
                              TextStyle(fontSize: 20, color: Colors.grey[700]),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ButtonTheme(
                            minWidth: 300,
                            height: 40,
                            child: RaisedButton(
                              color: Colors.blueAccent,
                              textColor: Colors.white,
                              onPressed: () {
                                Navigator.pushNamed(context, Login.id);
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(fontSize: 15),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.blueAccent)),
                              padding: EdgeInsets.all(10),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                            height: 20,
                          ),
                          ButtonTheme(
                            minWidth: 300,
                            height: 40,
                            child: RaisedButton(
                              color: Colors.blueAccent,
                              textColor: Colors.white,
                              onPressed: () {
                                Navigator.pushNamed(context, Register.id);
                              },
                              child: Text(
                                'Register',
                                style: TextStyle(fontSize: 15),
                              ),
                              padding: EdgeInsets.all(10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.blueAccent)),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
