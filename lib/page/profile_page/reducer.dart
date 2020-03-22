import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ProfileState> buildReducer() {
  return asReducer(
    <Object, Reducer<ProfileState>>{
      ProfileAction.action: _onAction,
      ProfileAction.fetchSuccess:_fetchSuccess,
      ProfileAction.fetchUserClipSuccess:_fetchUserClipSuccess,
    },
  );
}

ProfileState _onAction(ProfileState state, Action action) {
  final ProfileState newState = state.clone();
  return newState;
}

ProfileState _fetchSuccess(ProfileState state, Action action) {
  final ProfileState newState = state.clone();
  newState.user = action.payload;
  newState.refreshController.refreshCompleted();
  return newState;
}

ProfileState _fetchUserClipSuccess(ProfileState state, Action action) {
  final ProfileState newState = state.clone();
  newState.clipPage = action.payload;
  newState.clipList = newState.clipPage.records;
  newState.refreshController.refreshCompleted();
  return newState;
}
