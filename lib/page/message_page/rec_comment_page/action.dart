import 'package:fish_redux/fish_redux.dart';
import 'package:tape/models/comment.dart';

//TODO replace with your own action
enum RecCommentAction { fetchComment,fetchSuccess,fetchFailure,tapComment,tapAvatar }

class RecCommentActionCreator {
  static Action onFetchComment() {
    return const Action(RecCommentAction.fetchComment);
  }

  static Action onFetchSuccess(CommentPage commentPage){
    return Action(RecCommentAction.fetchSuccess,payload: commentPage);
  }
  static Action onFetchFailure(){
    return Action(RecCommentAction.fetchFailure);
  }

  static Action onTapComment(Comment comment) {
    return Action(RecCommentAction.tapComment,payload: comment);
  }

  static Action onTapAvatar(Comment comment) {
    return Action(RecCommentAction.tapAvatar,payload: comment);
  }
}
