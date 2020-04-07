import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainState implements Cloneable<MainState>{




  PageController controller;

  List<Color> colors = new List();

  List<Widget> pageList;


  @override
  MainState clone() {
    return MainState()
        ..controller =controller
        ..colors = colors
        ..pageList = pageList
        ..selectedIndex = selectedIndex;
  }

  int selectedIndex = 0;



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

