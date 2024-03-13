import 'dart:typed_data';

import '/database/storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class authMethod {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> UserSignUp({
    required String userName,
    required String email,
    required String password,
  }) async {
    String res = 'some error occured';
    try {
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _firestore
          .collection('users')
          .doc(
            FirebaseAuth.instance.currentUser!.uid,
          )
          .set({
        'userName': userName,
        'email': email,
        'password': password,
        'uid': _auth.currentUser!.uid,
      });
      res = 'success';
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> UserSignin({
    required String email,
    required String password,
  }) async {
    String res = 'some error occured';
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      res = 'success';
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  //add products to the page

  Future<String> addProduct({
    required String price,
    required String description,
    required String title,
    required Uint8List photourl,
    required List like,
  }) async {
    String res = 'some error occured';
    try {
      String url = await uploadingimage('product', photourl);

      if (title.isNotEmpty &&
          description.isNotEmpty &&
          price.isNotEmpty &&
          photourl != null) {
        String userID = const Uuid().v1();

        await _firestore.collection('products').doc(userID).set({
          'title': title,
          'price': price,
          'description': description,
          'photourl': url,
          'like': like,
          'userID': userID,
        });
        res = 'success';
      }
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  //like post code

  Future<void> likepost(String prodID, String userID, List like) async {
    try {
      if (like.contains(userID)) {
        await _firestore.collection('products').doc(prodID).update({
          'like': FieldValue.arrayRemove([userID])
        });
      } else {
        await _firestore.collection('products').doc(prodID).update({
          'like': FieldValue.arrayUnion([userID])
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  //sign in admin

  String AdminName = 'GDSCGROUPONE';
  String AdminEmail = 'GDSCGROUPEmail@gmail.com';

  Map<String, dynamic> tojson() {
    return {
      'adminpassword': AdminName,
      'adminEmail': AdminEmail,
    };
  }
}
