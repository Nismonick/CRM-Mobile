import 'dart:convert';

import 'package:andersgym/helpers/BaseModel.dart';
import 'package:andersgym/src/models/user_model.dart';
import 'package:andersgym/src/pages/login/widgets/LoginUserListView.dart';
import 'package:andersgym/src/providers/login_provider.dart';
import 'package:flutter/material.dart';

//Base Model extends Change Notifier
class LoginViewModel extends BaseModel {

  String _palsoftID;
  String _password;
  User _user;
  List<User> _users;

  String get palsoftID => _palsoftID;
  String get password => _password;
  User get user => _user;
  List<User> get users => _users;

  set setPalsoftID(String value) {
    _palsoftID = value;
    notifyListeners();
  }

  set setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  set setUser (User u) {
    _user = u;
    notifyListeners();
  }
  
  set setUsers (List<User> userList) {
    _users = userList;
    notifyListeners();
  }

  Future retrieveUsers(BuildContext context) async {

    final response = await loginProvider.listEmployees(context);
    var jsonObj = jsonDecode(response) as List;
    List<User> users =  jsonObj.map((e) => User.fromJson(e)).toList();
    setUsers = users;

    Navigator.push(context, 
      MaterialPageRoute(builder: (context) => 
        LoginUserListView()
      )
    );
  }

  Future<void> login(BuildContext context) async {
    setState(ViewState.Busy);

    final response = await loginProvider.authenticate(context, user.palSoftID);

    if (jsonDecode(response) == password) {
      Navigator.popAndPushNamed(context, 'home');
    }

    setState(ViewState.Idle);
  }
}
