import 'package:andersgym/helpers/validators.dart';
import 'package:flutter/material.dart';
import 'package:andersgym/src/pages/login/login_viewmodel.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class PasswordContainer extends StatelessWidget {
  Widget build(BuildContext context) {
    final loginVm = Provider.of<LoginViewModel>(context, listen: false);
    return Container(
      padding: EdgeInsets.all(8.0),
      child: TextField(
          obscureText: true,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            icon: const Icon(Icons.lock, color: Colors.grey),
            hintText: 'Password',
            border: InputBorder.none,
	          hintStyle: TextStyle(color: Colors.grey[400]),
            errorText: Validators().validatePassword(loginVm.password),
          ),
          onChanged: (value) => loginVm.setPassword = value),
    );
  }
}
