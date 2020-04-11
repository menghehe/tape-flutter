import 'package:fish_redux/fish_redux.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tape/models/comment.dart';
import 'package:tape/models/like.dart';
import 'package:tape/page/message_page/state.dart';


class LikeState implements Cloneable<LikeState> {

  int page;

  @override
  LikeState clone() {
    return LikeState()
        ..page = page
        ..refreshController = refreshController
        ..likePage = likePage
        ..likeList = likeList;
  }

  RefreshController refreshController;
  LikePage likePage;
  List<Like> likeList;
}

LikeState initState(LikeState initState) {
  return LikeState();
}

class LikeConnector extends ConnOp<MessageState, LikeState> {

  @override
  LikeState get(MessageState state) {
    LikeState subState = new LikeState();
    subState.likeList = state.likeList;
    subState.likePage = state.likePage;
    subState.refreshController = state.likeRefreshController;
    return subState;
  }

  @override
  void set(MessageState state, LikeState subState) {
    state.likePage = subState.likePage;
    state.likeList = subState.likeList;
  }


}
