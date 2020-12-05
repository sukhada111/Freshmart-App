import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freshmart/models/prod.dart';
import 'package:freshmart/models/user.dart';
import 'package:freshmart/screens/BestDeals.dart';
import 'package:freshmart/screens/aboutUs.dart';
import 'package:freshmart/screens/cart.dart';
import 'package:freshmart/screens/category.dart';
import 'package:freshmart/screens/myProfile.dart';
import 'package:freshmart/screens/welcome.dart';
import 'package:freshmart/services/auth.dart';
import 'package:freshmart/services/database.dart';
import 'package:provider/provider.dart';
import 'package:freshmart/screens/prod_tile.dart';
import 'globals.dart' as globals;

class SingleProduct extends StatefulWidget {
  static const String id = 'SingleProduct';
  final Product prod;
  final String prod_id;
  SingleProduct({this.prod, this.prod_id});

  @override
  _SingleProductState createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutUs()));
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
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(39),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 3, 0, 0),
                        height: 25,
                        width: 110,
                        decoration: BoxDecoration(
                          color: Colors.lightBlue[50],
                        ),
                        child: Text(
                          '${widget.prod.seller}',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 10, 0, 5),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Text(
                          "${widget.prod.name}, ${widget.prod.quantity}",
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.grey[800],
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Rs. ${widget.prod.price}',
                          style:
                              TextStyle(fontSize: 20, color: Colors.grey[700]),
                        ),
                        Text(
                          "(Inclusive of all Taxes)",
                          style: TextStyle(
                              fontSize: 19,
                              color: Colors.grey[500],
                              fontStyle: FontStyle.italic),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 300,
                    height: 300,
                    child: Image(
                      image: AssetImage("assets/images/${widget.prod.img}"),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 20, 0, 5),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Pack Sizes",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey[600]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SizedBox(
                      width: 350,
                      height: 50,
                      child: FlatButton(
                        onPressed: () {
                          setState(() {
                            if (!(globals.cartList.contains(widget.prod)))
                              globals.cartList.add(widget.prod);
                          });
                        },
                        child: Text(
                          "ADD TO CART",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.redAccent,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
