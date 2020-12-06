import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freshmart/models/prod.dart';
import 'package:freshmart/screens/BestDeals.dart';
import 'package:freshmart/screens/aboutUs.dart';
import 'package:freshmart/screens/category.dart';
import 'package:freshmart/screens/checkOut.dart';
import 'package:freshmart/screens/home.dart';
import 'package:freshmart/screens/myProfile.dart';
import 'package:freshmart/services/auth.dart';
import 'package:freshmart/screens/welcome.dart';
import 'globals.dart' as globals;

class Cart extends StatefulWidget {
  final List<Product> _cart;

  Cart(this._cart);

  @override
  _CartState createState() => _CartState(this._cart);
}

class _CartState extends State<Cart> {
  _CartState(this._cart);

  List<Product> _cart;
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
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
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
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
      body: ListView.builder(
          itemCount: _cart.length,
          itemBuilder: (context, index) {
            var item = _cart[index];
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
              child: SizedBox(
                width: 200,
                height: 100,
                child: Card(
                  margin: EdgeInsets.fromLTRB(18.0, 10.0, 20.0, 0.0),
                  elevation: 4.0,
                  child: Center(
                    child: ListTile(
                      leading: SizedBox(
                        width: 110,
                        height: 410,
                        child: Image.asset(
                          'assets/images/${item.img}',
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Text('${item.name}, ${item.quantity}',
                                style: TextStyle(fontSize: 20)),
                            Text('Price: ${item.price}',
                                style: TextStyle(color: Colors.black54)),
                          ],
                        ),
                      ),
                      trailing: GestureDetector(
                          child: Icon(
                            Icons.remove_circle,
                            color: Colors.red,
                          ),
                          onTap: () {
                            setState(() {
                              _cart.remove(item);
                            });
                          }),
                    ),
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (globals.cartList.length > 0) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => checkOut()));
          }
        },
        backgroundColor: Colors.redAccent,
        child: Text('Order'),
      ),
    ));
  }
}
