import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:tape/models/user.dart';

abstract class GlobalBaseState {
  Color get themeColor;
  set themeColor(Color color);

  User get user;
  set user(User u);

  ThemeData get themeData;
  set themeData (ThemeData themeData);



}

class GlobalState implements GlobalBaseState, Cloneable<GlobalState> {


  @override
  GlobalState clone() {
    return GlobalState();
  }

  @override
  User user;

  @override
  Color themeColor;

  @override
  ThemeData themeData = _lightTheme;

  static final  _lightTheme = ThemeData.light().copyWith(
      backgroundColor: Colors.white,
      tabBarTheme: TabBarTheme(
          labelColor: Color(0XFF505050),
          unselectedLabelColor: Colors.grey));
  static final _darkTheme = ThemeData.dark().copyWith(
      backgroundColor: Color(0xFF303030),
      tabBarTheme: TabBarTheme(
          labelColor: Colors.white, unselectedLabelColor: Colors.grey));

}
