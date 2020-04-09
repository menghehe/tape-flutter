import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class MessageState implements Cloneable<MessageState> {

  PageController pageController = PageController();
  TabController tabController;
  @override
  MessageState clone() {
    return MessageState();
  }
}

MessageState initState(Map<String, dynamic> args) {
  return MessageState();
}
