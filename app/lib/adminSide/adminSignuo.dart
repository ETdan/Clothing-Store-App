import 'package:shega_cloth_store_app/adminSide/adminScreen/adminHome.dart';
import 'package:shega_cloth_store_app/database/provider.dart';

import '/database/auth.dart';
import '/prefs/loginPreference.dart';
import '/screens/first-page.dart';
import '/utils/snackBar.dart';
import '/utils/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';
import 'package:provider/provider.dart';

class AdminSignup extends StatefulWidget {
  const AdminSignup({super.key});

  @override
  State<AdminSignup> createState() => _AdminSignupState();
}

class _AdminSignupState extends State<AdminSignup> {
  bool isCheak = false;
  TextEditingController adminnameController = TextEditingController();
  TextEditingController adminEmailController = TextEditingController();
  TextEditingController adminpasswordController = TextEditingController();
  TextEditingController adminCodeController = TextEditingController(); 
  bool isFinishedLogin = false;
 

  @override
  Widget build(BuildContext context) {
    DocumentSnapshot<Map<String, dynamic>> UserData;
    FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 100,
                left: 30,
              ),
              child: Text(
                'Getting Started',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                'create an account to continue,',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            textFields(
              controller: adminEmailController,
              hint: ' email',
              prefix: Icon(
                Icons.email_outlined,
              ), maxLines: 1,
            ),
            textFields(
              controller: adminnameController,
              hint: 'username',
              prefix: Icon(
                Icons.person_2_outlined,
              ), maxLines: 1,
            ),
            textFields(
              controller: adminpasswordController,
              hint: 'Password',
              prefix: Icon(
                Icons.password_outlined,
              ), maxLines: 1,
            ),
           
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Checkbox(
                    value: isCheak,
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          isCheak = value;
                        });
                      }
                    },
                    visualDensity: VisualDensity(
                      horizontal: -3.0,
                      vertical: -3.0,
                    ),
                  ),
                  Text(
                    'By creating an account, you agree to our\n Term and Condition',
                  ),
                ],
              ),
            ),
            Flexible(
              child: Container(),
              flex: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Consumer<defaultt>(
                  builder: (context, value, child) {
                    return MaterialButton(
                      height: 60,
                      minWidth: 400,
                      color: Color.fromARGB(255, 128, 140, 220),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      onPressed: () async {
                        setState(() {
                          isFinishedLogin = true;
                        });
                        String result = await authMethod().adminSignUp(
                          adminName: adminnameController.text,
                          adminEmail: adminEmailController.text,
                          adminPassword: adminpasswordController.text,
                         

                        );
                        setState(() {
                          isFinishedLogin = false;
                        });
                        if (result == 'success') {
                          UserData = await _firestore
                              .collection('admins')
                              .doc(
                                FirebaseAuth.instance.currentUser!.uid,
                              )
                              .get();

                          print(UserData.data());
                          Provider.of<UserProvider>(context, listen: false)
                              .adminSignInMap(UserData.data()!);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => adminHome(),
                            ),
                          );
                          setState(() {
                            value.toggle();
                            value.isAdminLogin();
                          });
                        } else {
                          showSnack(
                            'please,enter correct information or register first!',
                            context,
                          );
                        }
                      },
                      child: isFinishedLogin
                          ? Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : Container(
                              width: 350,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Sign up',
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
                            ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(
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
