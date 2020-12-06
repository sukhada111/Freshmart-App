import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freshmart/screens/BestDeals.dart';
import 'package:freshmart/screens/aboutUs.dart';
import 'package:freshmart/screens/cart.dart';
import 'package:freshmart/screens/category.dart';
import 'package:freshmart/screens/myProfile.dart';
import 'package:freshmart/screens/welcome.dart';
import 'package:freshmart/services/auth.dart';
import 'globals.dart' as globals;

class Home extends StatefulWidget {
  static const String id = 'Home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
//                      Navigator.push(
//                          context,
//                          MaterialPageRoute(
//                              builder: (context) => welcome_page()));
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
        appBar: AppBar(
          title: Text('Freshmart', textAlign: TextAlign.center),
          centerTitle: true,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 12.0, right: 8.0),
              child: GestureDetector(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Icon(
                      Icons.shopping_cart,
                      size: 36.0,
                    ),
                    if (globals.cartList.length > 0)
                      Padding(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: CircleAvatar(
                          radius: 8.0,
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          child: Text(
                            globals.cartList.length.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                onTap: () {
                  if (globals.cartList.isNotEmpty)
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Cart(globals.cartList),
                      ),
                    );
                },
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(9.0),
          child: ListView(
            children: [
              Center(
                  child: Text(
                'Welcome to Freshmart!',
                style: TextStyle(fontSize: 20),
              )),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      child: Image(
                        image: AssetImage("assets/images/headbanner.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 150,
                      child: Image(
                        image: AssetImage("assets/images/discounts.jpg"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        height: 150,
                        child: Image(
                          image: AssetImage("assets/images/category.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          Category.id,
                        );
                      },
                    ),
                  ],
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
        ),
      ),
    );
  }
}
