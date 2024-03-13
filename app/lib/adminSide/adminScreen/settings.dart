import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shega_cloth_store_app/adminSide/adminScreen/admin_profile_screens/edit_profile.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  String displayName = '';

  @override
  void initState() {
    super.initState();
    // Fetch the initial display name when the widget is created
    fetchDisplayName();
  }

  void fetchDisplayName() async {
    User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
          .collection('admins')
          .doc(currentUser.uid)
          .get();

      Map<String, dynamic>? data = snapshot.data();
      if (data != null && data.containsKey('adminName')) {
        setState(() {
          displayName = data['adminName'];
        });
      }
    }
  }

  void updateDisplayName(String newDisplayName) {
    setState(() {
      displayName = newDisplayName;
    });
  }


  @override
  Widget build(BuildContext context) {
    User? currentUser = FirebaseAuth.instance.currentUser;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Card(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Container(
                width: 350,
                height: 600,
                color: Color.fromARGB(255, 161, 161, 161),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          child: Center(
                            child: Text(currentUser?.displayName?.substring(0, 1) ?? 'G'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Card(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Container(
                              width: 300,
                              color: Color.fromARGB(255, 230, 227, 227),
                              child: Column(
                                children: [
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Text('Name :'),
                                      SizedBox(width: 5),
                                      FutureBuilder<DocumentSnapshot>(
                                        future: FirebaseFirestore.instance
                                            .collection('admins')
                                            .doc(currentUser?.uid)
                                            .get(),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState == ConnectionState.done) {
                                            Map<String, dynamic>? data =
                                                snapshot.data?.data() as Map<String, dynamic>?;
              
                                            
                                            String displayName =
                                                data?['adminName'] ?? currentUser?.displayName ?? 'No Name';
              
                                            return Text(displayName);
                                          }
              
                                          return CircularProgressIndicator(); //we will remove it later
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 15),
                                  Divider(
                                    thickness: 4,
                                    color: const Color.fromARGB(255, 223, 127, 240),
                                    endIndent: 2,
                                    height: 3,
                                  ),
                                   SizedBox(height: 15),
                                  Row(
                                    children: [
                                      Text('Email'),
                                      SizedBox(width: 5),
                                      Text(currentUser?.email ?? 'No Email'),
                                    ],
                                  ),
                                   SizedBox(height: 10),
                                  
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                   GestureDetector(
  onTap: () async {
    // Navigate to EditProfileScreen and wait for the result
    String updatedName = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditProfileScreen()),
    );

    // Update the display name on the Setting page
    setState(() {
      displayName = updatedName;
    });
  },
  child: Card(
    child: Container(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      width: 350,
      height: 40,
      child: const Row(
        children: [
          Icon(Icons.mail),
          SizedBox(width: 7),
          Text('contact'),
          Spacer(),
          Icon(Icons.arrow_forward_ios)
        ],
      ),
    ),
  ),
),

                     buildProfileCard(
              icon: Icons.edit,
              label: 'Edit Profile',
             onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditProfileScreen()),
    );
  },
            ),
            buildProfileCard(
              icon: Icons.settings,
              label: 'Settings',
              onPressed: () {
                // Handle settings button tap
              },
            ),
            buildProfileCard(
              icon: Icons.mail,
              label: 'Contact',
              onPressed: () {
                // Handle contact button tap
              },
            ),
           
            buildProfileCard(
              icon: Icons.book,
              label: 'Admin guide',
              onPressed: () {
                // Handle share app button tap
              },
            ),
         
            buildProfileCard(
              icon: Icons.help,
              label: 'Help',
              onPressed: () {
                // Handle help button tap
              },
            ),
            buildProfileCard(
              icon: Icons.help,
              label: 'Help',
              onPressed: () {
                // Handle help button tap
              },
            ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  
  Widget buildProfileCard({required IconData icon, required String label, required VoidCallback onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        child: Container(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          width: 350,
          height: 40,
          child: Row(
            children: [
              Icon(icon),
              SizedBox(width: 7),
              Text(
                label,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }
}
