import 'package:fish_redux/fish_redux.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:tape/customer_widgets/keepalive_widget.dart';
import 'package:tape/page/main_page/action.dart';
import 'package:tape/utils/adapt.dart';

import 'state.dart';

Widget buildView(MainState state, Dispatch dispatch, ViewService viewService) {
  return Builder(
    builder: (context){
      Adapt.initContext(context);
      ScreenUtil.getInstance();
      Widget _buildPage(Widget page) {
        return KeepAliveWidget(page);
      }

      return Scaffold(
        extendBody: true,
        body: PageView(
          controller: state.controller,
          physics: NeverScrollableScrollPhysics(),
          children: state.pageList.map(_buildPage).toList(),
          onPageChanged: (int i)=> dispatch(MainActionCreator.onPressTab(i)),
        ),
        // backgroundColor: Colors.green,
        // body: Container(color: Colors.red,),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: Adapt.px(44)),
              title: Text("首页"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message, size: Adapt.px(44)),
              title: Text("消息"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.create, size: Adapt.px(44)),
              title: Text("创作"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle, size: Adapt.px(44)),
              title: Text("我"),
            ),
          ],
          currentIndex: state.selectedIndex,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          onTap: (int index) {
            state.controller.jumpToPage(index);
          },
          type: BottomNavigationBarType.fixed,
        ),
      );

    },
  );
}
