import 'package:fish_redux/fish_redux.dart';
import 'package:tape/models/comment.dart';
import 'package:tape/models/like.dart';


enum LikeAction { fetchLike,fetchSuccess,fetchFailure,tapContent,tapAvatar }

class LikeActionCreator {
  static Action onFetchLike() {
    return const Action(LikeAction.fetchLike);
  }

  static Action onFetchSuccess(LikePage commentPage){
    return Action(LikeAction.fetchSuccess,payload: commentPage);
  }
  static Action onFetchFailure(){
    return Action(LikeAction.fetchFailure);
  }

  static Action onTapContent(Like like) {
    return Action(LikeAction.tapContent,payload: like);
  }

  static Action onTapAvatar(Like like) {
    return Action(LikeAction.tapAvatar,payload: like);
  }
}
