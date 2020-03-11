import 'package:andersgym/src/pages/login/login_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserContainer extends StatelessWidget {
  Widget build(BuildContext context) {

    final loginVm = Provider.of<LoginViewModel>(context, listen: true);
    return GestureDetector(
      onTap: () {
          _retrieveUsers(loginVm, context);
      },
      
      child:Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[100]))
      ),
      child: Container(
        alignment: Alignment.bottomLeft,
        padding: EdgeInsets.only(top:20),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Column(
              children: <Widget>[
                Icon(
                  Icons.person,
                  size: 30,
                  color: Colors.grey[500],
                )
              ], 
            ),
            Padding(
              padding: EdgeInsets.only(left:12, top: 5),
              child:Column(
                children: <Widget>[
                  Text(
                    loginVm.user != null ?loginVm.user.fullName : 'User' ,
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                ], 
              ),
            )
          ],
        ),
      ),
    )
    );
  }

  _retrieveUsers(LoginViewModel loginVm, BuildContext context) async {
    loginVm.retrieveUsers(context);
  }
}
