import 'package:flutter/material.dart';
import 'package:shega_cloth_store_app/adminSide/adminScreen/adminHome.dart';
import 'package:shega_cloth_store_app/adminSide/adminSignuo.dart';

import 'package:shega_cloth_store_app/database/auth.dart';
import 'package:shega_cloth_store_app/prefs/loginPreference.dart';
import 'package:shega_cloth_store_app/screens/signup.dart';
import 'package:shega_cloth_store_app/utils/snackBar.dart';
import 'package:provider/provider.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  TextEditingController adminEmailController = TextEditingController();
  TextEditingController adminPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Admin Login',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: adminEmailController,
                decoration: InputDecoration(
                  hintText: 'Admin Email',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: adminPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  String result = await authMethod().adminSignIn(
                    adminEmail: adminEmailController.text,
                    adminPassword: adminPasswordController.text,
                  );

                  if (result == 'success') {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => adminHome(),
                      ),
                    );
                  } else {
                    showSnack(
                      'Please enter correct information or register first!',
                      context,
                    );
                  }

                  // Additional logic as needed
                },
                child: Text('Sign in'),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AdminSignup(),
                    ),
                  );
                },
                child: Text(
                  "Don't have an account? Create account",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
