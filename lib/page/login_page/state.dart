import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tape/global_store/state.dart';

class LoginState implements Cloneable<LoginState> {

  TextEditingController usernameEditController;
  TextEditingController passwordEditController;

  FocusNode focusNodeUsername;
  FocusNode focusNodePassword;

  TextEditingController newUsernameEditController;
  TextEditingController newPasswordEditController;

  FocusNode focusNodeNewUsername;
  FocusNode focusNodeNewPassword;

  PageController pageController;

  Color signInTabColor;
  Color signUpTabColor;

  List<Widget> pageList;


  @override
  LoginState clone() {
    return LoginState()
    ..newPasswordEditController = newPasswordEditController
    ..newUsernameEditController = newUsernameEditController
    ..focusNodeNewPassword = focusNodeNewPassword
    ..focusNodeNewUsername = focusNodeNewUsername
    ..signInTabColor = signInTabColor
    ..signUpTabColor = signUpTabColor
    ..usernameEditController = usernameEditController
    ..passwordEditController = passwordEditController
    ..focusNodeUsername = focusNodeUsername
    ..focusNodePassword = focusNodePassword
    ..pageController = pageController;
  }


}

LoginState initState(Map<String, dynamic> args) {
  final LoginState state = LoginState();
  state.usernameEditController = TextEditingController();
  state.passwordEditController = TextEditingController();
  state.focusNodeUsername = FocusNode();
  state.focusNodePassword = FocusNode();
  state.newUsernameEditController = TextEditingController();
  state.newPasswordEditController = TextEditingController();
  state.focusNodeNewUsername = FocusNode();
  state.focusNodeNewPassword = FocusNode();
  state.pageController = PageController();
  state.signUpTabColor = Colors.grey;
  state.signInTabColor= Colors.green;
  state.pageList = args["pageList"];
  return state;
}
