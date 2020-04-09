import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<RecLikeState> buildReducer() {
  return asReducer(
    <Object, Reducer<RecLikeState>>{
      RecLikeAction.action: _onAction,
    },
  );
}

RecLikeState _onAction(RecLikeState state, Action action) {
  final RecLikeState newState = state.clone();
  return newState;
}
