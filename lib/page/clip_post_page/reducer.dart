import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ClipPostState> buildReducer() {
  return asReducer(
    <Object, Reducer<ClipPostState>>{
    },
  );
}

ClipPostState _onAction(ClipPostState state, Action action) {
  final ClipPostState newState = state.clone();
  return newState;
}
