import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    // Fetch the current user's display name and set it to the text controller
    _nameController.text = currentUser?.displayName ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
  onPressed: () async {
    // Update the user's display name
    String updatedName = await updateProfile(_nameController.text, context);

    // Navigate back to the previous screen and pass the updated name
    Navigator.pop(context, updatedName);
  },
  child: Text('Save Changes'),
),

          ],
        ),
      ),
    );
  }
Future<String> updateProfile(String newName, BuildContext context) async {
  try {
    await FirebaseAuth.instance.currentUser?.updateDisplayName(newName);
    await FirebaseFirestore.instance
        .collection('admins')
        .doc(currentUser?.uid)
        .update({'adminName': newName});

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Profile updated successfully'),
      ),
    );

    // Pass the updated name back to the previous screen
    Navigator.pop(context, newName);

    return newName; // Return the updated name
  } catch (e) {
    print('Error updating profile: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Failed to update profile. Please try again.'),
      ),
    );

    // Return an empty string or handle the error case accordingly
    return '';
  }
}

}
