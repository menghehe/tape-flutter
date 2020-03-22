import 'package:fish_redux/fish_redux.dart';
import 'package:tape/models/comment.dart';
import 'package:tape/models/comment_page.dart';

//TODO replace with your own action
enum PlayerAction { action,fetchComment,fetchSuccess,fetchFailure,addComment }

class PlayerActionCreator {
  static Action onAction() {
    return const Action(PlayerAction.action);
  }
  static Action onFetchComment(){
    return const Action(PlayerAction.fetchComment);
  }

  static Action onFetchSuccess(CommentPage commentPage){
    return Action(PlayerAction.fetchSuccess,payload: commentPage);
  }

  static Action onFetchFailure(){
    return const Action(PlayerAction.fetchFailure);
  }

  static Action onAddComment(){
    return Action(PlayerAction.addComment);
  }
}
