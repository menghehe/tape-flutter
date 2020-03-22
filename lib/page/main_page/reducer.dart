import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MainState> buildReducer() {
  return asReducer(
    <Object, Reducer<MainState>>{
      MainAction.action: _onAction,
      MainAction.onPressTab: _onPressTab
    },
  );
}

MainState _onAction(MainState state, Action action) {
  final MainState newState = state.clone();
  return newState;
}

MainState _onPressTab(MainState state,Action action){
  final MainState newState = state.clone();
  newState.selectedIndex = action.payload;
  state.controller.jumpToPage(newState.selectedIndex);
  return newState;
}
