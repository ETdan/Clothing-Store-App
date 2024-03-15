import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shega_cloth_store_app/database/provider.dart';

import 'dart:io';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController _nameController = TextEditingController();
  late File profileImageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () => _pickImageFromGallery(),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: profileImageUrl != null
                    ? Image.file(profileImageUrl).image
                    : NetworkImage(
                        'https://images.mubicdn.net/images/cast_member/286407/cache-139299-1463178721/image-w856.jpg?size=256x'),
              ),
            ),
            SizedBox(height: 20),
            Consumer<UserProvider>(
              builder: (context, userProvider, _) {
                _nameController.text = userProvider.userModel['username'];
                return TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _updateProfile();
              },
              child: Text('Update Profile'),
            ),
          ],
        ),
      ),
    );
  }

  void _updateProfile() {
    String newName = _nameController.text.trim();
    Provider.of<UserProvider>(context, listen: false).updateAdminName(newName);
    if (profileImageUrl != null) {
      // Upload image to storage and get URL
      String imageUrl = ''; // Replace with actual URL after uploading
      Provider.of<UserProvider>(context, listen: false)
          .updateAdminDefaultProfileImage(imageUrl);
    }
    Navigator.pop(context);
  }

  Future<void> _pickImageFromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {
        profileImageUrl = File(pickedImage.path);
      }
    });
  }
}
