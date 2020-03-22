import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<PlayerState> buildReducer() {
  return asReducer(
    <Object, Reducer<PlayerState>>{
      PlayerAction.action: _onAction,
      PlayerAction.fetchSuccess: _onFetchSuccess,
    },
  );
}

PlayerState _onAction(PlayerState state, Action action) {
  final PlayerState newState = state.clone();
  return newState;
}

PlayerState _onFetchSuccess(PlayerState state, Action action){
  final PlayerState newState = state.clone();
  newState.commentList = action.payload.records;
  return newState;

}
