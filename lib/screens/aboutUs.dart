import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freshmart/screens/category.dart';
import 'package:freshmart/screens/welcome.dart';
import 'package:freshmart/services/auth.dart';

class AboutUs extends StatefulWidget {
  static const String id = 'AboutUs';

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
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

          body:Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Text("About Us",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[800],
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Column(
                    children: [
                      Text("Hello There! "
                          "Happy Shopping!",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.grey[700],
                        ),
                        textAlign: TextAlign.center,

                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          "Welcome to Freshmart. Freshmart was established in the year 2015 and we ensure that our customers get the freshest products at the best price available, hence the name. Our aim is to redefine the freshest and finest food experience for our customers. Freshmart is different from the others as customers can view the various prices a product is sold at by different wholesalers. You can instantly see which wholesalers have your favourite products and choose one that suits you the best. Thereby, we connect wholesalers directly to customers without the involvement of middlemen. We proudly claim that Freshmart maintains maximum transparency with its customers.",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.grey[700],
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                          "Regards",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.grey[700],
                        ),

                      ),
                      Text(
                            "Team Freshmart",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.grey[700],
                        ),

                      ),
                    ],
                  ),

                )

              ],
            ),

            ),
          )
      ,
    );
  }
}
