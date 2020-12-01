import 'package:flutter/material.dart';
import 'package:freshmart/models/prod.dart';

class SingleProd extends StatelessWidget {
  final Product prod;
  final String prod_id;
  SingleProd({this.prod, this.prod_id});

  @override
  Widget build(BuildContext context) {
    if (prod_id == prod.id) {
      return MaterialApp(
          home: Scaffold(
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
        body: Center(child: Text('${prod.name} ${prod.quantity}')),
      ));
    } else {
      return Container();
    }
  }
}
