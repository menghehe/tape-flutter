import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<AuthState> buildReducer() {
  return asReducer(
    <Object, Reducer<AuthState>>{
      AuthAction.loginSuccess: _onAction,
    },
  );
}

AuthState _onAction(AuthState state, Action action) {
  final AuthState newState = state.clone();
  return newState;
}
