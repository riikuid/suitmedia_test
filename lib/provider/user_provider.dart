import 'package:flutter/material.dart';
import 'package:suitmedia_test/model/user_model.dart';
import 'package:suitmedia_test/services/user_service.dart';

class UserProvider with ChangeNotifier {
  List<UserModel> _users = [];
  List<UserModel> get users => _users;

  set products(List<UserModel> users) {
    _users = users;
    notifyListeners();
  }

  Future<void> getUserList() async {
    try {
      List<UserModel> users = await UserService().getUserList();
      _users = users;
    } catch (e) {
      print(e);
    }
  }
}
