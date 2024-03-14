import 'package:flutter/material.dart';
import 'package:shega_cloth_store_app/database/models/user.dart';

class UserProvider extends ChangeNotifier {
  Map<String, dynamic> userModel = {
    'username': "n/a",
    'password': "n/a",
    'email': "n/a",
    'uid': "n/a",
  };
  Map<String, dynamic> adminModel = {};

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

  void adminSignIn(Users admin) {
    adminModel = admin.tojson();
    notifyListeners();
  }

  void adminSignOut() {
    adminModel.clear();
    notifyListeners();
  }
}
