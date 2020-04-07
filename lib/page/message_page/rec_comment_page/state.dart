import 'package:fish_redux/fish_redux.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tape/models/comment.dart';

class RecCommentState implements Cloneable<RecCommentState> {

  @override
  RecCommentState clone() {
    return RecCommentState()
        ..refreshController = refreshController
        ..commentPage = commentPage
        ..commentList = commentList;
  }

  RefreshController refreshController;
  CommentPage commentPage;
  List<Comment> commentList;
}

RecCommentState initState(Map<String, dynamic> args) {
  return RecCommentState()
      ..refreshController = RefreshController();
}
