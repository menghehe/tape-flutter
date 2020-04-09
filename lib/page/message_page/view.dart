import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shifting_tabbar/shifting_tabbar.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(MessageState state, Dispatch dispatch, ViewService viewService){
  return Scaffold(
    appBar: ShiftingTabBar (
      controller: state.tabController,
      tabs: [
        ShiftingTab(
          icon: Icon(Icons.directions_bike),
          text: "Test 1",
        ),
        ShiftingTab(
            icon: Icon(Icons.directions_car),
            text: "Test 2"
        ),
        ShiftingTab(
            icon: Icon(Icons.directions_transit),
            text: "Test 3"
        ),
      ],
    ),
    body:PageView(
      controller: state.pageController,
      children: <Widget>[
        Icon(Icons.home),
        Icon(Icons.home),
        Icon(Icons.home),
      ],
    )
  );
}



