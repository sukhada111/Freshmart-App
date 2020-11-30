import 'package:flutter/cupertino.dart';
import 'package:freshmart/models/prod.dart';
import 'package:flutter/material.dart';

class ProdTile extends StatelessWidget {
  final Product prod;
  final String categor;
  ProdTile({this.prod, this.categor});

  @override
  Widget build(BuildContext context) {
    if (prod.cat == categor) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Card(
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
          child: ListTile(
            contentPadding: EdgeInsets.all(10.0),
            leading: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 100,
                minHeight: 154,
                maxWidth: 165,
                maxHeight: 444,
              ),
              child: Image.asset(
                'assets/images/${prod.img}',
                fit: BoxFit.cover,
              ),
            ),
            title: Text(prod.name, style: TextStyle(fontSize: 22)),
            subtitle: Text('Seller ${prod.seller},Price: ${prod.price}'),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
