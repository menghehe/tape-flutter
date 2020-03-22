
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tape/global_store/state.dart';
import 'package:tape/models/user.dart';

class MainState implements Cloneable<MainState>,GlobalBaseState {




  PageController controller;

  List<GButton> tabs = new List();
  List<Color> colors = new List();

  List<Widget> pageList;


  @override
  MainState clone() {
    return MainState()
        ..tabs =tabs
        ..controller =controller
        ..colors = colors
        ..pageList = pageList
        ..selectedIndex = selectedIndex
        ..themeData = themeData;
  }

  int selectedIndex = 0;

  @override
  Color themeColor;

  @override
  ThemeData themeData;

  @override
  User user;

}

MainState initState(Map<String, dynamic> args) {

  int selectedIndex = 0;
  PageController controller = PageController();

  var state = new MainState();
  state.selectedIndex = selectedIndex;
  state.controller = controller;
  state.pageList = args['pageList'];
  return state;
}

