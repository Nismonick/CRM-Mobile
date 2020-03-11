
import 'package:andersgym/src/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:andersgym/src/pages/login/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginUserListView extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final loginVm = Provider.of<LoginViewModel>(context, listen: true);
   
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.black,
            onPressed: (){
              showSearch(
                context: context, 
                delegate: EmployeeSearch(loginVm.users)
              );
            },
          )
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        
      ),
      body: Container(
        color: Colors.white,
          child: RefreshIndicator(
            onRefresh: (){
              //warning of unecessary statement, but provider listener is turned to true to update UI
              loginVm.retrieveUsers;
            },
            child: ListView(
            children: getUserList(context, loginVm.users, 0),
          ))
        )
    );
  }
}

class EmployeeSearch extends SearchDelegate<User> {
  final List<User> users;

  EmployeeSearch(this.users);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context){
    final loginVm = Provider.of<LoginViewModel>(context, listen: true);
    final results = loginVm.users.where((a) => a.fullName.toLowerCase().contains(query)).toList();
    
    return Container(
      color: Colors.white,
      child:ListView(
          children: getUserList(context, results, 1)
      )
    );
    
  }

  @override
  Widget buildSuggestions(BuildContext context){
    final loginVm = Provider.of<LoginViewModel>(context, listen: true);
    final results = loginVm.users.where((a) => a.fullName.toLowerCase().contains(query)).toList();
    
    return Container(
      color: Colors.white,
      child:ListView(
        children: getUserList(context, results, 1)
      )
    );
  }
}

List<Widget> getUserList (BuildContext context, List<User> users, int action) {

  final loginVm = Provider.of<LoginViewModel>(context, listen: true);

  List<Widget> employees = [];
    // for(User emp in loginVm.users)
    for(User emp in users)
    {
      employees.add(new 
      FlatButton(
      onPressed: () => {
        loginVm.setUser = emp,
        if(action == 1)
        {
          Navigator.pop(context),
          Navigator.pop(context)
        }
        else
          Navigator.pop(context)
      },
      child: Container(
        height:55,
        padding: EdgeInsets.all(10),
        child: Row(
            children: <Widget>[
              // CircleAvatar(),
              Text(emp.fullName),
              Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(3))
              ),
            )
          ],
        ),
      )
      ));
    }
    return employees;
}