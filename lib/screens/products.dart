import 'package:flutter/material.dart';
import 'package:freshmart/screens/BestDeals.dart';
import 'package:freshmart/screens/category.dart';
import 'package:freshmart/screens/prod_list.dart';
import 'package:freshmart/services/auth.dart';
import 'package:freshmart/services/database.dart';
import 'package:provider/provider.dart';
import 'package:freshmart/models/prod.dart';
import 'package:freshmart/screens/welcome.dart';

class ProductsPage extends StatelessWidget {
  final String cat;
  ProductsPage({this.cat});
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Product>>.value(
      value: ProductService().products,
      child: Scaffold(
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Category()));
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
                      MaterialPageRoute(builder: (context) => Category()));
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
        appBar: AppBar(
          title: Text('Freshmart'),
          backgroundColor: Colors.blue,
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.shopping_cart),
              label: Text(''),
              onPressed: () {
//                await _auth.signOut();
              },
            ),
          ],
        ),
        body: Container(child: ProdList(categ: cat)),
      ),
    );
  }
}
