import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tape/models/clip.dart';
import 'package:tape/models/user.dart';

class MineState implements Cloneable<MineState> {

  @override
  MineState clone() {
    return MineState()
        ..user = user
        ..clipPage = clipPage
        ..refreshController=refreshController
        ..clipList = clipList
        ..scrollController = scrollController;
  }

  ClipPage clipPage = new ClipPage();
  List<Clip> clipList = List();
  RefreshController refreshController = RefreshController();
  ScrollController scrollController = ScrollController();
  User user;
}

MineState initState(Map<String, dynamic> args) {
  return MineState();
}
