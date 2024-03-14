import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:shega_cloth_store_app/database/models/user.dart';
import 'package:shega_cloth_store_app/database/provider.dart';
import 'package:shega_cloth_store_app/screens/first-page.dart';

import '/database/storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';
import 'package:provider/provider.dart';

class authMethod {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Map<String, dynamic> userData = {};

  Future<String> UserSignUp(
      {required String userName,
      required String email,
      required String password,
      required context}) async {
    String res = 'some error occured';
    try {
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Users user = Users(
        username: userName,
        email: email,
        uid: _auth.currentUser!.uid,
        password: password,
      );

      await _firestore
          .collection('users')
          .doc(
            FirebaseAuth.instance.currentUser!.uid,
          )
          .set(user.tojson());
      Provider.of<UserProvider>(context).userSignIn(user);
      res = 'success';
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  signOut(context) async {
    await _auth.signOut();
    Provider.of<UserProvider>(context).userSignOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => first()));
  }

  Future<String> UserSignin(
      {required String email,
      required String password,
      required context}) async {
    String res = 'some error occured';
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      userData = (await _firestore
          .collection('users')
          .doc(
            FirebaseAuth.instance.currentUser!.uid,
          )
          .get()) as Map<String, dynamic>;

      Users user = Users(
          username: userData["username"],
          email: userData["email"],
          uid: userData["uid"],
          password: userData["password"]);
      Provider.of<UserProvider>(context).userSignIn(user);
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
