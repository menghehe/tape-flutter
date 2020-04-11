import 'package:fish_redux/fish_redux.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tape/models/comment.dart';
import 'package:tape/page/message_page/state.dart';


class CommentState implements Cloneable<CommentState> {

  int page;

  @override
  CommentState clone() {
    return CommentState()
        ..page = page
        ..refreshController = refreshController
        ..commentPage = commentPage
        ..commentList = commentList;
  }

  RefreshController refreshController;
  CommentPage commentPage;
  List<Comment> commentList;
}

CommentState initState(CommentState initState) {
  return CommentState();
}

class CommentConnector extends ConnOp<MessageState, CommentState> {

  @override
  CommentState get(MessageState state) {
    CommentState subState = new CommentState();
    subState.commentList = state.commentList;
    subState.commentPage = state.commentPage;
    subState.refreshController = state.commentRefreshController;
    return subState;
  }

  @override
  void set(MessageState state, CommentState subState) {
    state.commentPage = subState.commentPage;
    state.commentList = subState.commentList;
  }


}
