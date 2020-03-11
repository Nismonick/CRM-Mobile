import 'package:andersgym/src/pages/login/login_viewmodel.dart';

class Validators {

  String validatePalsoftID(String dni) {
    if (dni == null) {
      return null;
    }

    if (dni.length == 0) {
      return "Por favor ingrese su DNI";
    }
    return null;
  }

  String validatePassword(String password) {
    if (password == null) {
      return null;
    }

    if (password.length == 0) {
      return "Please re enter your password correctly.";
    }
    return null;
  }

  bool validateFormLogin(LoginViewModel loginVm) {
    if (loginVm.palsoftID == null) {
      return false;
    }

    if (loginVm.password == null) {
      return false;
    }

    if (loginVm.palsoftID.isEmpty) {
      return false;
    }

    if (loginVm.password.isEmpty) {
      return false;
    }

    return true;
  }
}
