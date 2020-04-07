import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MineState> buildReducer() {
  return asReducer(
    <Object, Reducer<MineState>>{
      MineAction.fetchUserInfoSuccess:_fetchUserInfoSuccess,
      MineAction.fetchUserInfoFailure:_fetchUserInfoFailure,
      MineAction.fetchUserClipSuccess:_fetchUserClipSuccess,
      MineAction.fetchUserClipFailure:_fetchUserClipFailure,
    },
  );
}


MineState _fetchUserInfoSuccess(MineState state, Action action) {
  final MineState newState = state.clone();
  newState.user = action.payload;
  newState.refreshController.refreshCompleted();
  return newState;
}

MineState _fetchUserInfoFailure(MineState state, Action action) {
  final MineState newState = state.clone();
  newState.refreshController.refreshCompleted();
  return newState;
}

MineState _fetchUserClipSuccess(MineState state, Action action) {
  final MineState newState = state.clone();
  newState.clipPage = action.payload;
  newState.clipList = newState.clipPage.records;
  newState.refreshController.refreshCompleted();
  return newState;
}
MineState _fetchUserClipFailure(MineState state, Action action) {
  final MineState newState = state.clone();
  newState.refreshController.refreshCompleted();
  return newState;
}
