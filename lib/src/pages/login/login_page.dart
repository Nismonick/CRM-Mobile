import 'package:andersgym/helpers/BaseModel.dart';
import 'package:andersgym/helpers/validators.dart';
import 'package:andersgym/src/animation/FadeAnimation.dart';
import 'package:andersgym/src/pages/login/login_viewmodel.dart';
import 'package:andersgym/src/pages/login/widgets/avatar_container.dart';
import 'package:andersgym/src/pages/login/widgets/user_container.dart';
import 'package:andersgym/src/providers/login_provider.dart';
import 'package:andersgym/src/widgets/circular_loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/password_container.dart';

class LoginPage extends StatelessWidget {
  final loginProvider = new LoginProvider();
  final _avatarContainer = AvatarContainer();
  final _userContainer = UserContainer();
  final _passwordContainer = PasswordContainer();

  @override
  Widget build(BuildContext context) {
    Provider.of<LoginViewModel>(context, listen: false);

    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      // resizeToAvoidBottomPadding: true,
      body: Stack(
        children: <Widget>[
          new Container(
            height: 470,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/splash.png'),
                fit: BoxFit.fill
              )
            ),
          ),
          SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding: EdgeInsets.only(bottom: bottom),
              child: Center(
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 50),
                    _avatarContainer,
                    // const SizedBox(height: 10),
                    _crearLabels(),
                    const SizedBox(height: 55),
                    _loginForm(context),
                     _crearBotonLogin(context)
                  ],
                ),
              ),
            ),
          ),
        ],
      )
    );
  }

  _crearLabels() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/crm.png'),
          fit: BoxFit.scaleDown
        )
      ),
      padding: EdgeInsets.only(top: 120),
    );
  }

  Widget _loginForm(BuildContext context) {
    // final size = MediaQuery.of(context).size;

    return Padding(
      padding:EdgeInsets.all(30.0),
      child:
        Column(
          children: <Widget>[
            FadeAnimation(1.8, Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(143, 148, 251, .2),
                      blurRadius: 20.0,
                      offset: Offset(0, 10)
                    )
                  ]
                ),
                child: Column(
                  children: <Widget>[
                    _userContainer,
                    const SizedBox(height: 10),
                    _passwordContainer,
                  ],
                ),
              )
            ),
          ],
        ),
    );
  }

  Widget _crearBotonLogin(context) {
    final loginVm = Provider.of<LoginViewModel>(context);
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: loginVm.state == ViewState.Busy
          ? CircularLoading()
          : FadeAnimation(2, 
              GestureDetector(
              onTap: () => _logearse(loginVm, context) ,
              child: Container(
                width: MediaQuery.of(context).size.width * .8,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(243, 185, 22, 1),
                      Color.fromRGBO(241, 201, 85, .6),
                    ]
                  )
                ),
                child: Center(
                  child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                ),
              ),
            )
          ),
    );
  }

  _logearse(LoginViewModel loginVm, BuildContext context) async {
    FocusScope.of(context).unfocus(); // Cerrar keyboard
    loginVm.login(context);
  }

  
}
