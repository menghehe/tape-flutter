import 'package:fish_redux/fish_redux.dart';
import 'package:tape/models/comment.dart';


enum CommentAction { fetchComment,fetchSuccess,fetchFailure,tapComment,tapAvatar }

class CommentActionCreator {
  static Action onFetchComment() {
    return const Action(CommentAction.fetchComment);
  }

  static Action onFetchSuccess(CommentPage commentPage){
    return Action(CommentAction.fetchSuccess,payload: commentPage);
  }
  static Action onFetchFailure(){
    return Action(CommentAction.fetchFailure);
  }

  static Action onTapComment(Comment comment) {
    return Action(CommentAction.tapComment,payload: comment);
  }

  static Action onTapAvatar(Comment comment) {
    return Action(CommentAction.tapAvatar,payload: comment);
  }
}
