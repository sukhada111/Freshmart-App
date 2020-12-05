import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freshmart/models/prod.dart';
import 'package:freshmart/screens/BestDeals.dart';
import 'package:freshmart/screens/aboutUs.dart';
import 'package:freshmart/screens/cart.dart';
import 'package:freshmart/screens/home.dart';
import 'package:freshmart/screens/login.dart';
import 'package:freshmart/screens/myProfile.dart';
import 'package:freshmart/screens/products.dart';
import 'package:freshmart/screens/welcome.dart';
import 'package:freshmart/services/auth.dart';
import 'globals.dart' as globals;

class Category extends StatefulWidget {
  static const String id = 'Category';
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final AuthService _auth = AuthService();
  List categ = [
    Categories(
        imageUrl: 'assets/images/veg5.jpg',
        name: "Fruits and Vegetables",
        line: "Get fresh fruits and vegetables at the best price!",
        catt: 'fv'),
    Categories(
        imageUrl: "assets/images/fg2.jpg",
        name: "Oils and Food Grains",
        line: "Get best quality oils and food grains!",
        catt: 'og'),
    Categories(
        imageUrl: "assets/images/milk.jpg",
        name: "Dairy and Bakery",
        line: "Get highly nutritious dairy and bakery products!",
        catt: 'db')
  ];

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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BestDeals()));
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
        appBar: AppBar(
          title: Text('Freshmart', textAlign: TextAlign.center),
          centerTitle: true,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 16.0, top: 8.0),
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
        body: Container(
          padding: EdgeInsets.fromLTRB(5.0, 70.0, 5.0, 2.0),
          child: ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: categ.length,
            itemBuilder: (context, index) {
              return SizedBox(
                width: 500,
                height: 140,
                child: GestureDetector(
                  child: Card(
                      child: Center(
                    child: ListTile(
                      contentPadding: EdgeInsets.all(10.0),
                      leading: Container(
                        height: 120,
                        width: 100,
                        child: Image.asset(categ[index].imageUrl,
                            fit: BoxFit.cover),
                      ),
                      title: Text(
                        categ[index].name,
                        style: TextStyle(fontSize: 20),
                      ),
                      subtitle: Text(categ[index].line),
                    ),
                  )),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ProductsPage(cat: categ[index].catt)));
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class Categories {
  String imageUrl;
  String name;
  String line;
  String catt;

  Categories({this.imageUrl, this.name, this.line, this.catt});
}
