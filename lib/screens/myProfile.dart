import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freshmart/models/user.dart';
import 'package:freshmart/screens/BestDeals.dart';
import 'package:freshmart/screens/category.dart';
import 'package:freshmart/screens/singleProduct.dart';
import 'package:freshmart/screens/welcome.dart';
import 'package:freshmart/services/auth.dart';
import 'package:freshmart/services/database.dart';
import 'package:provider/provider.dart';
import 'package:freshmart/screens/home.dart';
import 'package:freshmart/screens/aboutUs.dart';

class MyProfile extends StatefulWidget {
  static const String id = 'MyProfile';
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users>(context);
    if (user != null) {
      return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          UserData userData = snapshot.data;
          return MaterialApp(
            home: Scaffold(
                drawer: Drawer(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      Container(
                        height: 100,
                        child: DrawerHeader(
                          child: Text(
                            'Main Menu',
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.category,
                          color: Colors.grey[700],
                        ),
                        title: Text(
                          'Shop By Category',
                          style:
                              TextStyle(color: Colors.grey[700], fontSize: 19),
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Category.id,
                          );
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.info_outline,
                          color: Colors.grey[700],
                        ),
                        title: Text(
                          'About Us',
                          style:
                              TextStyle(color: Colors.grey[700], fontSize: 19),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AboutUs()));
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.account_balance_wallet,
                          color: Colors.grey[700],
                        ),
                        title: Text(
                          'Best Deals',
                          style:
                              TextStyle(color: Colors.grey[700], fontSize: 19),
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            BestDeals.id,
                          );
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.lock,
                          color: Colors.grey[700],
                        ),
                        title: Text(
                          'Logout',
                          style:
                              TextStyle(color: Colors.grey[700], fontSize: 19),
                        ),
                        onTap: () async {
                          await _auth.signOut();
                          Navigator.pushNamed(
                            context,
                            welcome_page.id,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                bottomNavigationBar: BottomNavigationBar(
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                        icon: FlatButton(
                          child: Icon(
                            Icons.home,
                            size: 25,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          },
                        ),
                        title: Text('Home')),
                    BottomNavigationBarItem(
                        icon: FlatButton(
                          child: Icon(
                            Icons.grid_on,
                            size: 25,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Category()));
                          },
                        ),
                        title: Text('Categories')),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.person,
                        size: 25,
                      ),
                      title: Text('Profile'),
                    ),
                  ],
                ),
                appBar: AppBar(
                  title: Text('Freshmart', textAlign: TextAlign.center),
                  centerTitle: true,
                ),
                body: Column(
                  children: [
                    Center(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Text(
                          "MY PROFILE",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[800],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 140,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.redAccent, Colors.orange[100]])),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(35, 2, 20, 2),
                        child: Row(
                          children: [
                            Icon(
                              Icons.person,
                              size: 50,
                              color: Colors.white,
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(35, 10, 50, 0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        userData.name,
                                        style: TextStyle(
                                          fontSize: 25,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    userData.pno,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(0, 15, 0, 5),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          color: Colors.red[900],
                                          size: 25,
                                        ),
                                        Text(
                                          userData.addr,
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.location_city,
                        color: Colors.grey[700],
                      ),
                      title: Text(
                        'My Delivery Address - ' + userData.addr,
                        style: TextStyle(color: Colors.grey[700], fontSize: 19),
                      ),
                      onTap: () async {
                        await _auth.signOut();
                        Navigator.pushNamed(
                          context,
                          welcome_page.id,
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.lock,
                        color: Colors.grey[700],
                      ),
                      title: Text(
                        'Logout',
                        style: TextStyle(color: Colors.grey[700], fontSize: 19),
                      ),
                      onTap: () async {
                        await _auth.signOut();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => welcome_page()));
                      },
                    )
                  ],
                )),
          );
        },
      );
    } else {
      return Container();
    }
  }
}
