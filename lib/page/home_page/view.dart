import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tape/utils/adapt.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  final ListAdapter adapter = viewService.buildAdapter();
  return Scaffold(
    appBar: PreferredSize(
        child: AppBar(
          backgroundColor: Colors.white,
          title: Padding(
            padding: EdgeInsets.only(left: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                DropdownButton<String>(
                  value: '推荐',
                  underline: SizedBox(),
                  icon: SizedBox(),
                  items: <DropdownMenuItem<String>>[
                    DropdownMenuItem(child: Text('推荐'), value: '推荐'),
                    DropdownMenuItem(child: Text('关注'), value: '关注'),
                    DropdownMenuItem(child: Text('好友'), value: '好友'),
                  ],
                  onChanged: (String value) {},
                ),
              ],
            ),
          ),
          automaticallyImplyLeading: false,
        ),
        preferredSize: Size.fromHeight(Adapt.screenH() * 0.07)),
    body: Container(
        child: SmartRefresher(
      child: ListView.builder(
          itemBuilder: adapter.itemBuilder, itemCount: adapter.itemCount),
      onRefresh: () => dispatch(HomeActionCreator.refresh()),
      onLoading: () => dispatch(HomeActionCreator.refresh()),
      controller: state.refreshController,
      enablePullDown: true,
      enablePullUp: true,
      header: WaterDropMaterialHeader(
        color: Colors.white,
      ),
      footer: ClassicFooter(
        loadStyle: LoadStyle.ShowWhenLoading,
      ),
    )),
  );
}
