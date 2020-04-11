import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<CommentState> buildReducer() {
  return asReducer(
    <Object, Reducer<CommentState>>{
      CommentAction.fetchSuccess: _onFetchSuccess,
      CommentAction.fetchFailure: _onFetchFailure,
    },
  );
}

CommentState _onFetchSuccess(CommentState state, Action action) {
  state.refreshController.refreshCompleted();
  final CommentState newState = state.clone();
  newState.commentPage = action.payload;
  newState.commentList = newState.commentPage.records;
  newState.refreshController.refreshCompleted();
  return newState;
}

CommentState _onFetchFailure(CommentState state, Action action) {
  state.refreshController.refreshCompleted();
  final CommentState newState = state.clone();
  newState.refreshController.refreshCompleted();
  return newState;
}
