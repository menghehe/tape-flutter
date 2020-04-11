import 'package:fish_redux/fish_redux.dart';
import 'package:tape/models/clip.dart';
import 'package:tape/models/comment.dart';
import 'package:tape/models/like.dart';

enum PlayerAction { fetchClip,fetchClipSuccess,fetchClipFailure, fetchComment,fetchSuccess,
  fetchFailure,addComment, tapLike,likeSuccess}

class PlayerActionCreator {
  static Action onFetchClip() {
    return const Action(PlayerAction.fetchClip);
  }
  static Action onFetchClipSuccess(Clip clip) {
    return Action(PlayerAction.fetchClipSuccess,payload: clip);
  }

  static Action onFetchClipFailure() {
    return const Action(PlayerAction.fetchClipFailure);
  }


  static Action onFetchComment(){
    return const Action(PlayerAction.fetchComment);
  }

  static Action onFetchSuccess(LikePage commentPage){
    return Action(PlayerAction.fetchSuccess,payload: commentPage);
  }

  static Action onFetchFailure(){
    return const Action(PlayerAction.fetchFailure);
  }

  static Action onAddComment(){
    return Action(PlayerAction.addComment);
  }

  static Action onTapLike(Like like){
    return Action(PlayerAction.tapLike,payload: like);
  }

  static Action onLikeSuccess(Like like){
    return Action(PlayerAction.likeSuccess,payload: like);
  }
}
