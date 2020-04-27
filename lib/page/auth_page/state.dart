import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class AuthState implements Cloneable<AuthState> {

  @override
  AuthState clone() {
    return AuthState()
        ..pageList = pageList
        ..token = token;
  }

  List<Widget> pageList;
  String token;

}

AuthState initState(Map<String, dynamic> args) {
  return AuthState()
        ..pageList = args["pageList"];
}
