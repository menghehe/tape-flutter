import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tape/models/clip.dart';
import 'package:tape/models/user.dart';

class ProfileState implements Cloneable<ProfileState>{

  @override
  ProfileState clone() {
    return ProfileState()
        ..clipPage = clipPage
        ..refreshController=refreshController
        ..clipList = clipList
        ..scrollController = scrollController
        ..profileUser = profileUser;
  }

  ClipPage clipPage = new ClipPage();
  List<Clip> clipList = List();
  RefreshController refreshController = RefreshController();
  ScrollController scrollController = ScrollController();


  User profileUser;
}

ProfileState initState(Map<String, dynamic> args) {
  return ProfileState()
      ..profileUser = args['profileUser'];
}
