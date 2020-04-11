import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:tape/models/user.dart';

class FriendState implements Cloneable<FriendState> {

  @override
  FriendState clone() {
    return FriendState()
        ..type = type
        ..friendPage = friendPage
        ..friendList = friendList;
  }

  //1关注的人，2粉丝
  int type;
  UserPage friendPage;
  List<User> friendList;

}

FriendState initState(Map<String, dynamic> args) {
  return FriendState()
      ..type = args['type'];
}
