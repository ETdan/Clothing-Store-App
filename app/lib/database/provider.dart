import 'package:flutter/material.dart';
import 'package:shega_cloth_store_app/database/models/user.dart';

class UserProvider extends ChangeNotifier {
  Map<String, dynamic> userModel = {};

  void userSignIn(Users user) {
    userModel = user.tojson();
    notifyListeners();
  }

  void userSignOut() {
    userModel.clear();
    notifyListeners();
  }
}
