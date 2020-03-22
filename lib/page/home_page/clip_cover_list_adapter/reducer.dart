import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ClipCoverListState> buildReducer() {
  return asReducer(
    <Object, Reducer<ClipCoverListState>>{
      ClipCoverListAction.action: _onAction,
    },
  );
}

ClipCoverListState _onAction(ClipCoverListState state, Action action) {
  final ClipCoverListState newState = state.clone();
  return newState;
}
