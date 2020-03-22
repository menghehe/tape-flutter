import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  final ListAdapter adapter = viewService.buildAdapter();
  println("------buildView ${adapter.toString()}  || ${adapter.itemCount}");
  return Scaffold(
    appBar: AppBar(
      backgroundColor: state.themeData.backgroundColor,
      title: const Text('Home'),
      automaticallyImplyLeading: false,
      actions: <Widget>[
        FlatButton(
          textColor: Colors.white,
          onPressed:()=> dispatch(HomeActionCreator.onAdd()),
          child: Icon(Icons.add),
          shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
        ),
      ],
    ),
    body: Container(
      child: SmartRefresher(
        child: ListView.builder(
                    itemBuilder: adapter.itemBuilder,
                    itemCount: adapter.itemCount
        ),
        onRefresh: ()=>dispatch(HomeActionCreator.refresh()),
        onLoading: ()=>dispatch(HomeActionCreator.refresh()),
        controller: state.refreshController,
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropMaterialHeader(color: state.themeData.backgroundColor,),
        footer: ClassicFooter(
          loadStyle: LoadStyle.ShowWhenLoading,
        ),
      )
    ),
  );
}
