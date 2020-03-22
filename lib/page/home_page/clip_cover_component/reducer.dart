import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ClipCoverState> buildReducer() {
  return asReducer(
    <Object, Reducer<ClipCoverState>>{
      ClipCoverAction.action: _onAction,
    },
  );
}

ClipCoverState _onAction(ClipCoverState state, Action action) {
  final ClipCoverState newState = state.clone();
  return newState;
}
