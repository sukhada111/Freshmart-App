import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List categ = [
    Categories(
        imageUrl: 'assets/images/veg5.jpg',
        name: "Fruits and Vegetables",
        line: "Get fresh fruits and vegetables at the best price!"),
    Categories(
        imageUrl: "assets/images/fg2.jpg",
        name: "Oils and Food Grains",
        line: "Get best quality oils and food grains!"),
    Categories(
        imageUrl: "assets/images/milk.jpg",
        name: "Dairy and Bakery",
        line: "Get highly nutritious dairy and bakery products!")
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
                  child: Text('Main Menu',style: TextStyle(color: Colors.white,fontSize: 20),),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                ),
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('Freshmart',textAlign: TextAlign.center),
          centerTitle: true,

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
                child: Card(
                    child: Center(
                  child: ListTile(
                    contentPadding: EdgeInsets.all(10.0),
                    leading: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: 100,
                        minHeight: 970,
                        maxWidth: 500,
                        maxHeight: 980,
                      ),
                      child:
                          Image.asset(categ[index].imageUrl, fit: BoxFit.cover),
                    ),
                    title: Text(
                      categ[index].name,
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: Text(categ[index].line),
                  ),
                )),
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

  Categories({this.imageUrl, this.name, this.line});
}
