import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tape/utils/adapt.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  final ListAdapter adapter = viewService.buildAdapter();

  Widget _buildList(){
    if(state.dropdownValue == '热门'){
      return ListView.builder(
        itemBuilder: adapter.itemBuilder,
        itemCount: adapter.itemCount,
      );
    }
    return SmartRefresher(
      child: ListView.builder(
        itemBuilder: adapter.itemBuilder,
        itemCount: adapter.itemCount,
      ),
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
    );
  }

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
                  value: state.dropdownValue,
                  underline: SizedBox(),
                  icon: SizedBox(),
                  items: <DropdownMenuItem<String>>[
                    DropdownMenuItem(child: Text('推荐'), value: '推荐'),
                    DropdownMenuItem(child: Text('热门'), value: '热门'),
                  ],
                  onChanged: (String value) { dispatch(HomeActionCreator.dropDownChange(value));},
                ),
              ],
            ),
          ),
          automaticallyImplyLeading: false,
        ),
        preferredSize: Size.fromHeight(Adapt.screenH() * 0.07)),
    body: Padding(
      padding: EdgeInsets.only(bottom: Adapt.screenH() * 0.07),
      child: _buildList(),
    ),
  );
}
