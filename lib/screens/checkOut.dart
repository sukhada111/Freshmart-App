import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freshmart/screens/BestDeals.dart';
import 'package:freshmart/screens/aboutUs.dart';
import 'package:freshmart/screens/category.dart';
import 'package:freshmart/screens/myProfile.dart';
import 'package:freshmart/screens/welcome.dart';
import 'package:freshmart/services/auth.dart';


import 'home.dart';


class checkOut extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('MY CART')),
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
    style: TextStyle(color: Colors.grey[700], fontSize: 19),
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
    style: TextStyle(color: Colors.grey[700], fontSize: 19),
    ),
    onTap: () {
    Navigator.pushNamed(
    context,
    AboutUs.id,
    );
    },
    ),
    ListTile(
    leading: Icon(
    Icons.account_balance_wallet,
    color: Colors.grey[700],
    ),
    title: Text(
    'Best Deals',
    style: TextStyle(color: Colors.grey[700], fontSize: 19),
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
    Navigator.push(context,
    MaterialPageRoute(builder: (context) => Home()));
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
    Navigator.push(context,
    MaterialPageRoute(builder: (context) => Category()));
    },
    ),
    title: Text('Categories')),
    BottomNavigationBarItem(
    icon: FlatButton(
    child: Icon(
    Icons.person,
    size: 25,
    ),
    onPressed: () {
    Navigator.push(context,
    MaterialPageRoute(builder: (context) => MyProfile()));
    },
    ),
    title: Text('Profile'),
    ),
    ],
    ),

      body:Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 25, 10, 20),
              child: Text(
                "Order Sucessful!",
                style: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 200,
              width: 200,
              child: Image(
                image: AssetImage("assets/images/mini.jpg"),
              ),
            )
          ],
        ),
      ),

    );
  }
}
