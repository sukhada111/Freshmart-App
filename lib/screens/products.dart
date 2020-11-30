import 'package:flutter/material.dart';
import 'package:freshmart/screens/prod_list.dart';
import 'package:freshmart/services/auth.dart';
import 'package:freshmart/services/database.dart';
import 'package:provider/provider.dart';
import 'package:freshmart/models/prod.dart';

class ProductsPage extends StatelessWidget {
  final String cat;
  ProductsPage({this.cat});
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Product>>.value(
      value: ProductService().products,
      child: Scaffold(
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
