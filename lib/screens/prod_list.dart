import 'package:flutter/material.dart';
import 'package:freshmart/screens/prod_tile.dart';
import 'package:provider/provider.dart';
import 'package:freshmart/models/prod.dart';

class ProdList extends StatelessWidget {
  final String categ;
  ProdList({this.categ});

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<List<Product>>(context) ?? [];
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProdTile(prod: products[index], categor: categ);
      },
    );
  }
}
