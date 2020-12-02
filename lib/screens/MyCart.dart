import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freshmart/screens/category.dart';
import 'package:freshmart/screens/welcome.dart';
import 'package:freshmart/services/auth.dart';

class MyCart extends StatefulWidget {

  static const String id = 'MyCart';
  final String seller;
  final String prodname;
  final int prodprice;
  final String quan;
  final  prodimg;


  MyCart(this.seller,this.prodname,this.prodprice,this.quan,this.prodimg);

  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
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
    actions: [
    IconButton(icon: Icon(Icons.shopping_cart),
    onPressed: (){},
    color: Colors.white,
    )
    ],
    ),

          body: Stack(
            children: <Widget>[
              Container(
          padding: const EdgeInsets.only(top: 8.0),
          child: GestureDetector(
            child: Card(
              margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
              child: ListTile(
                contentPadding: EdgeInsets.fromLTRB(10, 5.0, 3.0, 5.0),
                leading: SizedBox(
                  width: 120,
                  height: 300,
                  child: Image.asset(
                    'assets/images/${widget.prodimg}',
                    fit: BoxFit.cover,
                  ),
                ),
                title: Column(
                  children: <Widget>[
                    Text('${widget.prodname}, ${widget.quan}',
                        style: TextStyle(fontSize: 22)),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        'Sold by: ${widget.seller}',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                    Text('Price: ${widget.prodprice}',
                        style: TextStyle(color: Colors.black54)),
                  ],
                ),
              ),
            ),
          ),
        ),
            ],
          ),
    ),
    );
  }
}
