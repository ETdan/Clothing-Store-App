import 'package:shega_cloth_store_app/adminSide/adminLogin.dart';
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
      body: Stack(
        children: [ Container( 


          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xffB81736),
                Color(0xff281537),
              ]
              ),
          ),
          child: 
              Padding(
                padding: EdgeInsets.only(top: 60, left:22),
                child: Text("Getting Started\nCreate Account",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),),
                ),
               
           
        ),

        Padding(
          padding: const EdgeInsets.only(top: 200.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft:Radius.circular(40) , topRight: Radius.circular(40)),
              color: Colors.white,
            ),
            height: double.infinity,
            width: double.infinity,
            child:  Padding(
              padding: const EdgeInsets.only(left: 18, right: 18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  TextField(
                    controller: adminEmailController,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.check, color: Colors.grey,),
                      label: Text("Gmail", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xffB81736),
                      ),)
                    ),
                  ),
                   TextField(
                    controller: adminnameController,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.check, color: Colors.grey,),
                      label: Text("User name", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xffB81736),
                      ),)
                    ),
                  ),
                  TextField(
                     controller: adminpasswordController,
                      decoration: InputDecoration(
                      suffixIcon: Icon(Icons.visibility_off, color: Colors.grey,),
                      label: Text("Password", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xffB81736),
                      ),)
                    ),
                  ),
                  SizedBox(height: 20),
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

                  
                  


SizedBox(height: 7,),
Container(
  height: 55,
  width: 300,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(30),
      gradient: LinearGradient(
              colors: [
                Color(0xffB81736),
                Color(0xff281537),
              ]
              ),

  ),
  
  child: Consumer<defaultt>(
                  builder: (context, value, child) {
                    return Container(
                           decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(30),
    gradient: LinearGradient(
      colors: [
        Color(0xffB81736),
        Color(0xff281537),
      ],
    ),
  ),

                      child: MaterialButton(
                        height: 60,
                        minWidth: 400,
                        
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
                                        color: const Color.fromARGB(221, 255, 255, 255),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Icon(
                                      Icons.login_outlined,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                      ),
                    );
                  },
                ),


),
SizedBox(height: 5,),

SizedBox(height: 5,),

Align(
  alignment: Alignment.bottomRight,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Text('You have an account?', style: TextStyle(fontSize: 16),),
       TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AdminLogin(),
                      ),
                    );
                  },
                  child: Text(
                    'Sign In',
                  ),
                ),

    ],
  ),
),

              
                ],
              ),
            ),
          ),
        ),
        ]
    
      ),
    );
  }
}
