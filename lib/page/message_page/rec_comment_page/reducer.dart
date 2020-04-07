import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<RecCommentState> buildReducer() {
  return asReducer(
    <Object, Reducer<RecCommentState>>{
      RecCommentAction.fetchSuccess: _onFetchSuccess,
      RecCommentAction.fetchFailure: _onFetchFailure,
    },
  );
}

RecCommentState _onFetchSuccess(RecCommentState state, Action action) {
  final RecCommentState newState = state.clone();
  newState.commentPage = action.payload;
  newState.commentList = newState.commentPage.records;
  newState.refreshController.refreshCompleted();
  return newState;
}

RecCommentState _onFetchFailure(RecCommentState state, Action action) {
  final RecCommentState newState = state.clone();
  newState.refreshController.refreshCompleted();
  return newState;
}
