import 'package:shega_cloth_store_app/adminSide/adminScreen/adminHome.dart';
import 'package:shega_cloth_store_app/database/provider.dart';
import 'package:shega_cloth_store_app/screens/login.dart';
import '/database/auth.dart';
import '/prefs/loginPreference.dart';
import '/utils/snackBar.dart';
import '/utils/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  TextEditingController adminpasswordController = TextEditingController();
  TextEditingController adminEmailController = TextEditingController();
  bool isloggedin = true;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    Map<String, dynamic> userData;
    FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          shrinkWrap: false,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                right: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const signin(),
                        ),
                      );
                    },
                    child: const Text(
                      'User Login',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 100,
                left: 30,
              ),
              child: Text(
                'Let\'s Sign You In',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                'Welcome back,',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            textFields(
              controller: adminEmailController,
              hint: 'Username or email',
              prefix: const Icon(
                Icons.person_2_outlined,
              ),
              maxLines: 1,
            ),
            textFields(
              controller: adminpasswordController,
              hint: 'Password',
              prefix: const Icon(
                Icons.shopping_bag_rounded,
              ),
              maxLines: 1,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Consumer<defaultt>(
                  builder: (context, value, child) {
                    return MaterialButton(
                        height: 60,
                        minWidth: width * 0.8,
                        color: const Color.fromARGB(255, 128, 140, 220),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        onPressed: () async {
                          setState(() {
                            isloggedin = false;
                          });
                          String result = await authMethod().adminSignIn(
                            adminEmail: adminEmailController.text,
                            adminPassword: adminpasswordController.text,
                          );
                          setState(() {
                            isloggedin = true;
                          });
                          if (result == 'success') {
                            var snapshot = await _firestore
                                .collection('admins')
                                .doc(
                                  FirebaseAuth.instance.currentUser!.uid,
                                )
                                .get();
                            userData = snapshot.data()!;
                            print(userData);
                            Provider.of<UserProvider>(context, listen: false)
                                .adminSignInMap(userData);
                            showSnack(
                              'Welcome back!',
                              context,
                            );
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const adminHome(),
                              ),
                            );
                          } else {
                            showSnack(
                              'please,enter correct information or register first!',
                              context,
                            );
                          }
                        },
                        child: isloggedin
                            ? Container(
                                width: width * 0.6,
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Signin',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Icon(
                                      Icons.login_outlined,
                                    ),
                                  ],
                                ),
                              )
                            : const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.green,
                                ),
                              ));
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Flexible(
              child: Container(),
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
