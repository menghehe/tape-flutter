import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ProfileState> buildReducer() {
  return asReducer(
    <Object, Reducer<ProfileState>>{
      ProfileAction.fetchUserInfoSuccess:_fetchUserInfoSuccess,
      ProfileAction.fetchUserInfoFailure:_fetchUserInfoFailure,
      ProfileAction.fetchUserClipSuccess:_fetchUserClipSuccess,
      ProfileAction.fetchUserClipFailure:_fetchUserClipFailure,
    },
  );
}


ProfileState _fetchUserInfoSuccess(ProfileState state, Action action) {
  final ProfileState newState = state.clone();
  newState.profileUser = action.payload;
  newState.refreshController.refreshCompleted();
  return newState;
}

ProfileState _fetchUserInfoFailure(ProfileState state, Action action) {
  final ProfileState newState = state.clone();
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
ProfileState _fetchUserClipFailure(ProfileState state, Action action) {
  final ProfileState newState = state.clone();
  newState.refreshController.refreshCompleted();
  return newState;
}
