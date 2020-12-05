import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freshmart/screens/aboutUs.dart';
import 'package:freshmart/screens/category.dart';
import 'package:freshmart/screens/home.dart';
import 'package:freshmart/screens/welcome.dart';
import 'package:freshmart/services/auth.dart';

class BestDeals extends StatefulWidget {
  static const String id = 'BestDeals';

  @override
  _BestDealsState createState() => _BestDealsState();
}

class _BestDealsState extends State<BestDeals> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
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
                      Category.id,
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
                      Category.id,
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
            actions: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {},
                color: Colors.white,
              )
            ],
          ),
          body: Container(
            padding: EdgeInsets.all(10),
            width: 400,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    child: Text(
                      "Our Best Deals",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[800],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  width: 420,
                  height: 150,
                  child: Image(
                    image: AssetImage("assets/images/fifoff.jpg"),
                  ),
                ),
                Container(
                  width: 400,
                  height: 200,
                  child: Image(
                    image: AssetImage("assets/images/b2g2.jpg"),
                  ),
                ),
                Container(
                  width: 400,
                  height: 100,
                  child: Image(
                    image: AssetImage("assets/images/bf.jpeg"),
                    width: 400,
                  ),
                ),
                SizedBox(
                  width: 10,
                  height: 30,
                ),
                ButtonTheme(
                  minWidth: 300,
                  height: 50,
                  child: RaisedButton(
                    color: Colors.redAccent,
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Category()));
                    },
                    child: Text(
                      'SHOP NOW',
                      style: TextStyle(fontSize: 15),
                    ),
                    padding: EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.redAccent)),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
