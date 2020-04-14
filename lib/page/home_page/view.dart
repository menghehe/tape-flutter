import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tape/utils/adapt.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  final ListAdapter adapter = viewService.buildAdapter();
  return Scaffold(
    appBar: PreferredSize(
        child: AppBar(
          title: Text(
            '推荐',
            style: TextStyle(color: Colors.black),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
        ),
        preferredSize: Size.fromHeight(Adapt.screenH() * 0.07)),
    body: Padding(
        padding: EdgeInsets.only(bottom: Adapt.screenH() * 0.07),
        child: SmartRefresher(
          child: ListView.builder(
              itemBuilder: adapter.itemBuilder, itemCount: adapter.itemCount),
          onRefresh: () => dispatch(HomeActionCreator.refresh()),
          onLoading: () => dispatch(HomeActionCreator.loadMore()),
          controller: state.refreshController,
          enablePullDown: true,
          enablePullUp: true,
          header: WaterDropMaterialHeader(
            color: Colors.white,
          ),
          footer: ClassicFooter(
            loadStyle: LoadStyle.ShowAlways,
          ),
        )),
  );
}
