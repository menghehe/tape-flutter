import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tape/global_store/state.dart';
import 'package:tape/models/user.dart';
import 'package:tape/page/home_page/clip_cover_component/state.dart';

class HomeState implements Cloneable<HomeState> ,GlobalBaseState,MutableSource{

  @override
  HomeState clone() {
    return HomeState()
    ..refreshController = refreshController
    ..clipCoverStateList =clipCoverStateList
        ..user = user
        ..themeData = themeData;
  }


  List<ClipCoverState> clipCoverStateList;

  @override
  int get itemCount {
    return clipCoverStateList?.length ??0;
  }

  @override
  String getItemType(int index) {
    return "clipCover";
  }

  @override
  Object getItemData(int index) {
    return clipCoverStateList[index];
  }

  @override
  void setItemData(int index, Object data) {
    clipCoverStateList[index] = data;
  }

  @override
  MutableSource updateItemData(int index, Object data, bool isStateCopied) {
    // TODO: implement updateItemData
    return null;
  }


  RefreshController refreshController;

  @override
  Color themeColor;

  @override
  ThemeData themeData;

  @override
  User user;


}

HomeState initState(Map<String, dynamic> args) {
  return HomeState()
      ..refreshController = new RefreshController();
}


