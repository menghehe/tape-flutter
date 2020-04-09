import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

// ExampleActionCreator
Widget buildView(
    ExampleState state, Dispatch dispatch, ViewService viewService) {
  final adapter = viewService.buildAdapter();
  return Scaffold(
    appBar: AppBar(
      title: Text("adpater"),
    ),
    body: Column(
      children: <Widget>[
        TabBar(controller: state.tabController, tabs: [
          ListTile(
            title: Text("AAAA"),
          ),
          ListTile(
            title: Text("BBBB"),
          )
        ]),
        Expanded(
            child: TabBarView(controller: state.tabController, children: [
          ListView.builder(
            itemBuilder: adapter.itemBuilder,
            itemCount: adapter.itemCount,
          ),
          ListView.builder(
            itemBuilder: adapter.itemBuilder,
            itemCount: adapter.itemCount,
          ),
        ]))
      ],
    ),
  );
}
