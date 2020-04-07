import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:tape/models/user.dart';

class FriendState implements Cloneable<FriendState> {

  @override
  FriendState clone() {
    return FriendState()
        ..friendPage = friendPage
        ..friendList = friendList;
  }

  UserPage friendPage;
  List<User> friendList;

}

FriendState initState(Map<String, dynamic> args) {
  return FriendState();
}
