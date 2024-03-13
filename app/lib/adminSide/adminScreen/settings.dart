import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Access the current user from FirebaseAuth
    User? currentUser = FirebaseAuth.instance.currentUser;

    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            child: Center(
           
              child: Text(currentUser?.displayName?.substring(0, 1) ?? 'G'),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text('Name'),
          Card(
            child: FutureBuilder<DocumentSnapshot>(
              future: FirebaseFirestore.instance
                  .collection('admins')
                  .doc(currentUser?.uid)
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic>? data =
                      snapshot.data?.data() as Map<String, dynamic>?;

                  // Use the adminName variable from Firestore if available, else use display name
                  String displayName =
                      data?['adminName'] ?? currentUser?.displayName ?? 'No Name';

                  return Text(displayName);
                }

                return CircularProgressIndicator();//we will remove it later
              },
            ),
          ),
          Text('Email'),
          Card(
            child: Text(currentUser?.email ?? 'No Email'),
          ),
        ],
      ),
    );
  }
}
