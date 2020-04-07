import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/animation.dart';

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
//  state.controller.animateToPage(action.payload,
////      duration: Duration(milliseconds: 300), curve: Curves.ease);
  state.controller.jumpToPage(action.payload);
  return newState;
}
