import 'package:fish_redux/fish_redux.dart';
import 'package:tape/models/clip.dart';
import 'package:tape/models/comment.dart';
import 'package:tape/models/like.dart';

enum PlayerAction {
  fetchClip,
  fetchClipSuccess,
  fetchClipFailure,
  fetchComment,
  fetchCommentSuccess,
  fetchCommentFailure,
  addComment,
  addCommentSuccess,
  addCommentFailure,
  tapLike,
  likeSuccess
}

class PlayerActionCreator {
  static Action onFetchClip() {
    return const Action(PlayerAction.fetchClip);
  }

  static Action onFetchClipSuccess(Clip clip) {
    return Action(PlayerAction.fetchClipSuccess, payload: clip);
  }

  static Action onFetchClipFailure() {
    return const Action(PlayerAction.fetchClipFailure);
  }

  static Action onFetchComment() {
    return const Action(PlayerAction.fetchComment);
  }

  static Action onFetchSuccess(CommentPage commentPage) {
    return Action(PlayerAction.fetchCommentSuccess, payload: commentPage);
  }

  static Action onFetchFailure() {
    return const Action(PlayerAction.fetchCommentFailure);
  }

  static Action onAddComment() {
    return Action(PlayerAction.addComment);
  }

  static Action onAddCommentSuccess() {
    return const Action(PlayerAction.addCommentSuccess);
  }
  static Action onAddCommentFailure() {
    return const Action(PlayerAction.addCommentFailure);
  }

  static Action onTapLike(Like like) {
    return Action(PlayerAction.tapLike, payload: like);
  }

  static Action onLikeSuccess(Like like) {
    return Action(PlayerAction.likeSuccess, payload: like);
  }
}
