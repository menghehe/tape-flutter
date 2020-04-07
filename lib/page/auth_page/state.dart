import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class AuthState implements Cloneable<AuthState> {

  @override
  AuthState clone() {
    return AuthState()
        ..pageList = pageList;
  }

  List<Widget> pageList;

}

AuthState initState(Map<String, dynamic> args) {
  return AuthState()
        ..pageList = args["pageList"];
}
