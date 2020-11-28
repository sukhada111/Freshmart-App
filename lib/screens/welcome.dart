import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freshmart/screens/category.dart';

void main() {
  runApp(Category());
}
class welcome_page extends StatelessWidget {
  static const String id= 'welcome_page';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Freshmart",style: TextStyle(color: Colors.white),),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(100, 10, 100, 10),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 90,
                          backgroundColor: Colors.black,
                          child: CircleAvatar(
                            backgroundImage: AssetImage("assets/images/logo-black.png"),
                            radius: 90,
                            backgroundColor: Colors.white,

                          ),
                        ),

                      ],
                    )
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(80, 40, 80, 20),
                  child: Column(
                    children: [
                      Container(
                        padding:EdgeInsets.fromLTRB(0, 10, 0, 20) ,
                        child :
                        Text(
                          "Welcome to Freshmart!",
                          style: TextStyle(fontSize: 20, color: Colors.grey[700]),
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
                              onPressed: (){},
                              child: Text('Login', style: TextStyle(fontSize: 15),),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.blueAccent)
                              ),

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
                              onPressed: (){},
                              child: Text('Register',style: TextStyle(fontSize: 15),),
                              padding: EdgeInsets.all(10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.blueAccent)
                              ),

                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
