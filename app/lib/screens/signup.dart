import 'package:app/screens/first-page.dart';
import 'package:app/utils/textfield.dart';
import 'package:flutter/material.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  bool isCheak = false;
  @override
  Widget build(BuildContext context) {
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
              hint: ' email',
              prefix: Icon(
                Icons.email_outlined,
              ),
            ),
            textFields(
              hint: 'username',
              prefix: Icon(
                Icons.person_2_outlined,
              ),
            ),
            textFields(
              hint: 'Password',
              prefix: Icon(
                Icons.password_outlined,
              ),
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
                MaterialButton(
                  height: 60,
                  minWidth: 400,
                  color: Color.fromARGB(255, 128, 140, 220),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => first(),
                      ),
                    );
                  },
                  child: Container(
                    width: 400,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
