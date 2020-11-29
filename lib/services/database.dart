import 'package:freshmart/models/user.dart';
import 'package:freshmart/models/products.dart';
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
