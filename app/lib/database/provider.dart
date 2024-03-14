import 'package:flutter/material.dart';
import 'package:shega_cloth_store_app/database/models/user.dart';

class UserProvider extends ChangeNotifier {
  Map<String, dynamic> userModel = {
    'username': "n/a",
    'password': "n/a",
    'email': "n/a",
    'uid': "n/a",
    'profileImageUrl': null, 
  };

  void userSignIn(Users user) {
    userModel = user.tojson();
    notifyListeners();
  }

  void userSignInMap(Map<String, dynamic> user) {
    userModel = user;
    notifyListeners();
  }

  void userSignOut() {
    userModel.clear();
    notifyListeners();
  }

  Map<String, dynamic> adminModel = {
    'username': "n/a",
    'password': "n/a",
    'email': "n/a",
    'uid': "n/a",
    'profileImageUrl': null, 
  };

  void adminSignIn(Users admin) {
    adminModel = admin.tojson();
    notifyListeners();
  }

  void adminSignInMap(Map<String, dynamic> admin) {
    adminModel = admin;
    notifyListeners();
  }

  void adminSignOut() {
    adminModel.clear();
    notifyListeners();
  }

  // Method to update admin name
  void updateAdminName(String newName) {
    userModel['username'] = newName;
    notifyListeners();
  }

  // Method to update default profile image for admin
  void updateDefaultProfileImage(String newImageUrl) {
    userModel['profileImageUrl'] = newImageUrl;
    notifyListeners();
  }
}
