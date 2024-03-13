import 'package:flutter/material.dart';
import 'package:shega_cloth_store_app/adminSide/adminScreen/adminHome.dart';
import 'package:shega_cloth_store_app/database/auth.dart';
import 'package:shega_cloth_store_app/prefs/loginPreference.dart';
import 'package:shega_cloth_store_app/utils/snackBar.dart';
import 'package:provider/provider.dart';

class AdminSignup extends StatefulWidget {
  const AdminSignup({Key? key}) : super(key: key);

  @override
  State<AdminSignup> createState() => _AdminSignupState();
}

class _AdminSignupState extends State<AdminSignup> {
  TextEditingController adminUserNameController = TextEditingController();
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
                'Admin Signup',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: adminUserNameController,
                decoration: InputDecoration(
                  hintText: 'Admin Username',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: adminEmailController,
                decoration: InputDecoration(
                  hintText: 'Admin Email',
                  prefixIcon: Icon(Icons.email),
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
                  String result = await authMethod().adminSignUp(
                    adminName: adminUserNameController.text,
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
                      'Signup failed. Please try again!',
                      context,
                    );
                  }

                  // Additional logic as needed
                },
                child: Text('Sign up'),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Navigate back to the previous screen
                },
                child: Text(
                  'Already have an account? Sign in',
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
