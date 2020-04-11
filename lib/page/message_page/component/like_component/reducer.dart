import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<LikeState> buildReducer() {
  return asReducer(
    <Object, Reducer<LikeState>>{
      LikeAction.fetchSuccess: _onFetchSuccess,
      LikeAction.fetchFailure: _onFetchFailure,
    },
  );
}

LikeState _onFetchSuccess(LikeState state, Action action) {
  state.refreshController.refreshCompleted();
  final LikeState newState = state.clone();
  newState.likePage = action.payload;
  newState.likeList = newState.likePage.records;
  newState.refreshController.refreshCompleted();
  return newState;
}

LikeState _onFetchFailure(LikeState state, Action action) {
  state.refreshController.refreshCompleted();
  final LikeState newState = state.clone();
  newState.refreshController.refreshCompleted();
  return newState;
}
