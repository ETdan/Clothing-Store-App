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
      required String password}) async {
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

      res = 'success';
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  signOut(context) async {
    await _auth.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => first()));
  }

  Future<String> UserSignin(
      {required String email, required String password}) async {
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
    required String gender,
    required String color,
    required String brand,
    required String category, // Add category field
  }) async {
    String res = 'some error occurred';
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
          'gender': gender,
          'color': color,
          'brand': brand,
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

  Future<void> UserSignOut(BuildContext context) async {
    try {
      await _auth.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                first()), // Replace with your first screen widget
      );
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  //sign in admin
/*
  String AdminName = 'GDSCGROUPONE';
  String AdminEmail = 'GDSCGROUPEmail@gmail.com';

  Map<String, dynamic> tojson() {
    return {
      'adminpassword': AdminName,
      'adminEmail': AdminEmail,
    };
  }*/
  Future<String> adminSignUp({
    required String adminName,
    required String adminEmail,
    required String adminPassword,
  }) async {
    try {
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
        email: adminEmail,
        password: adminPassword,
      );

      await _firestore.collection('admins').doc(_auth.currentUser!.uid).set({
        'adminName': adminName,
        'adminEmail': adminEmail,
        'adminPassword': adminPassword,
        'uid': _auth.currentUser!.uid,
      });

      return 'success';
    } catch (e) {
      print('Error during admin signup: $e');
      return 'Signup failed. Please try again!';
    }
  }

  Future<String> adminSignIn({
    required String adminEmail,
    required String adminPassword,
  }) async {
    String res = 'some error occurred';
    try {
      await _auth.signInWithEmailAndPassword(
        email: adminEmail,
        password: adminPassword,
      );
      res = 'success';
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
