import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freshmart/screens/login.dart';
import 'package:freshmart/screens/welcome.dart';
import 'package:freshmart/services/auth.dart';

class Category extends StatefulWidget {
  static const String id = 'Category';
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final AuthService _auth = AuthService();
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
              icon: FlatButton
                (
                  child: Icon(Icons.home,size: 25,),
                  onPressed: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>welcome_page())
                    );
                  },
              ),
                title: Text('Home')

            ),
            BottomNavigationBarItem(
              icon: FlatButton
                (child: Icon(Icons.grid_on,size: 25,),
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>Category())
                  );
                },
              ),
                title: Text('Categories')

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person,size: 25,),
              title: Text('Profile'),
            ),

          ],
        ),
        appBar: AppBar(
          title: Text('Freshmart', textAlign: TextAlign.center),
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
