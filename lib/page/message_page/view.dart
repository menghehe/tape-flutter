import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:tape/utils/adapt.dart';

import 'state.dart';

Widget buildView(
    MessageState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    body: Column(
      children: <Widget>[
        SizedBox(
          height: Adapt.padTopH(),
        ),
        Container(
          height: Adapt.screenH()*0.07,
            child: TabBar(
              labelColor: Colors.green,
                controller: state.tabController,
                tabs: [
              ListTile(
                title: Text("评论"),
              ),
              ListTile(
                title: Text("点赞"),
              )
            ]),
        ),
        Expanded(
            child: TabBarView(controller: state.tabController, children: [
          viewService.buildComponent('commentComponent'),
          viewService.buildComponent('likeComponent')
        ]))
      ],
    ),
  );
}
