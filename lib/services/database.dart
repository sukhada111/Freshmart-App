import 'package:freshmart/models/user.dart';
import 'package:freshmart/models/prod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  // collection reference
  final CollectionReference userscoll =
      FirebaseFirestore.instance.collection('users');

  Future<void> updateUserData(
      String name, String uname, String pno, String addr, String email) async {
    return await userscoll.doc(uid).set({
      'name': name,
      'username': uname,
      'contact': pno,
      'address': addr,
      'email': email
    });
  }

// user data from snapshots
//  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
//    return UserData(
//        uid: uid,
//        name: snapshot.data['name'],
//        uname: snapshot.data['username'],
//        pno: snapshot.data['contact']
//        addr: snapshot.data['address'],
//        email: snapshot.data['email']
//    );
//  }

//  // get user doc stream
//  Stream<UserData> get userData {
//    return userscoll.doc(uid).snapshots().map(_userDataFromSnapshot);
//  }

}

class ProductService {
  //get products data from coll
  CollectionReference productscoll =
      FirebaseFirestore.instance.collection('Products');

  //get products list from snapshot
  List<Product> _prodListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Product(
          id: doc.id,
          name: doc.data()['Name'] ?? '',
          seller: doc.data()['Seller'] ?? '',
          price: doc.data()['Price'] ?? 0,
          quantity: doc.data()['Quantity'] ?? 0,
          cat: doc.data()['Category'] ?? '',
          img: doc.data()['img'] ?? '');
    }).toList();
  }

  //get products stream
  Stream<List<Product>> get products {
    return productscoll.snapshots().map(_prodListFromSnapshot);
  }
}
