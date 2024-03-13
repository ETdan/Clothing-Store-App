import 'package:flutter/material.dart';
import 'package:shega_cloth_store_app/adminSide/adminScreen/adminHome.dart';
import 'package:shega_cloth_store_app/database/auth.dart';
import 'package:shega_cloth_store_app/utils/snackBar.dart';

class AdminSignup extends StatefulWidget {
  const AdminSignup({Key? key}) : super(key: key);

  @override
  State<AdminSignup> createState() => _AdminSignupState();
}

class _AdminSignupState extends State<AdminSignup> {
  TextEditingController adminUserNameController = TextEditingController();
  TextEditingController adminEmailController = TextEditingController();
  TextEditingController adminPasswordController = TextEditingController();

  bool isUserNameValid = true;
  bool isEmailValid = true;

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
                onChanged: (value) {
                  setState(() {
                    isUserNameValid = validateUserName(value);
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Admin Username',
                  prefixIcon: Icon(Icons.person),
                  errorText: isUserNameValid
                      ? null
                      : 'Username must be between 3 and 20 characters and unique.',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: adminEmailController,
                onChanged: (value) {
                  setState(() {
                    isEmailValid = validateEmail(value);
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Admin Email',
                  prefixIcon: Icon(Icons.email),
                  errorText: isEmailValid
                      ? null
                      : 'Invalid email format or already in use.',
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
                  if (isUserNameValid && isEmailValid) {
                    String result = await authMethod().adminSignUp(
                      adminName: adminUserNameController.text,
                      adminEmail: adminEmailController.text,
                      adminPassword: adminPasswordController.text,
                    );

                    if (result == 'success') {
                      Navigator.pushReplacement(
                        context,
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
                  } else {
                    showSnack(
                      'Please fix the validation errors!',
                      context,
                    );
                  }
                },
                child: Text('Sign up'),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
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

  bool validateUserName(String value) {
    if (value.length >= 3 && value.length <= 20) {
      return true;
    } else {
      return false;
    }
  }

  bool validateEmail(String value) {
    // Perform email format check
    if (value.isNotEmpty && value.contains('@')) {
      // Perform uniqueness check (replace with your actual logic)
      // If the email is unique, return true; otherwise, return false.
      return true;
    } else {
      return false;
    }
  }
}
