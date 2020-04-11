import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<FriendState> buildReducer() {
  return asReducer(
    <Object, Reducer<FriendState>>{
      FriendAction.fetchFriendSuccess: _onFetchFriendSuccess,
      FriendAction.fetchFriendFailure: _onFetchFriendFailure,
    },
  );
}


FriendState _onFetchFriendSuccess(FriendState state, Action action) {
  final FriendState newState = state.clone();
  newState.friendPage = action.payload;
  newState.friendList = newState.friendPage.records;
  return newState;
}

FriendState _onFetchFriendFailure(FriendState state, Action action) {
  final FriendState newState = state.clone();
  return newState;
}
