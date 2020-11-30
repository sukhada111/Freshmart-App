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
          margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
          child: ListTile(
            contentPadding: EdgeInsets.fromLTRB(10, 5.0, 3.0, 5.0),
            leading: SizedBox(
              width: 120,
              height: 300,
              child: Image.asset(
                'assets/images/${prod.img}',
                fit: BoxFit.cover,
              ),
            ),
            title: Column(
              children: <Widget>[
                Text('${prod.name}, ${prod.quantity}',
                    style: TextStyle(fontSize: 22)),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    'Sold by: ${prod.seller}',
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
                Text('Price: ${prod.price}',
                    style: TextStyle(color: Colors.black54)),
              ],
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
