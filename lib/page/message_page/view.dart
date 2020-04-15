import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:shifting_tabbar/shifting_tabbar.dart';
import 'package:tape/customer_widgets/keepalive_widget.dart';
import 'package:tape/utils/adapt.dart';

import 'state.dart';

Widget buildView(
    MessageState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: PreferredSize(
      child: Material(
        elevation: 4.0,
        child: ShiftingTabBar(
          labelStyle: TextStyle(color: Colors.green),
          controller: state.tabController,
          // Specify a color to background or it will pick it from primaryColor of your app ThemeData
          color: Colors.white,
          // You can change brightness manually to change text color style to dark and light or
          // it will decide based on your background color
          brightness: Brightness.light,
          tabs: [
            // Also you should use ShiftingTab widget instead of Tab widget to get shifting animation
            ShiftingTab(
              icon: Icon(Icons.comment),
              text: "评论",
            ),
            ShiftingTab(
              icon: Icon(Icons.thumb_up),
              text: "点赞",
            ),
          ],
        ),
      ),
      preferredSize: Size.fromHeight(Adapt.screenH() * 0.07),
    ),
    body: TabBarView(controller: state.tabController, children: [
      viewService.buildComponent('commentComponent'),
      viewService.buildComponent('likeComponent'),
    ]),
  );
}
