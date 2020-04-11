import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tape/models/comment.dart';
import 'package:tape/models/like.dart';


class MessageState implements Cloneable<MessageState> {

  int select = 0;

  TabController tabController;

  CommentPage commentPage;
  List<Comment> commentList;
  LikePage likePage;
  List<Like> likeList;
  RefreshController commentRefreshController = RefreshController();
  RefreshController likeRefreshController = RefreshController();


  @override
  MessageState clone() {
    return MessageState()
      ..tabController=tabController
      ..select=select
        ..commentPage = commentPage
        ..commentList = commentList
        ..likePage = likePage
        ..likeList = likeList;
  }
}

MessageState initState(MessageState initState) {
  return MessageState();
}
