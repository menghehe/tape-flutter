import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

import 'action.dart';
import 'state.dart';

Reducer<LoginState> buildReducer() {
  return asReducer(
    <Object, Reducer<LoginState>>{
      LoginAction.signUp: _onAction,
      LoginAction.pageChanged: _onPageChanged,
      LoginAction.signInTab:_onSignInTab,
      LoginAction.signUpTab:_onSignUpTab
    },
  );
}

LoginState _onAction(LoginState state, Action action) {
  final LoginState newState = state.clone();
  return newState;
}


LoginState _onPageChanged(LoginState state, Action action) {
  var page = state.pageController.page;
  if( page < 0.5){
    state.signInTabColor = Colors.green;
    state.signUpTabColor = Colors.grey;
  }else{
    state.signInTabColor = Colors.grey;
    state.signUpTabColor = Colors.green;
  }
  final LoginState newState = state.clone();
  return newState;
}


LoginState _onSignInTab(LoginState state, Action action){
  state.signInTabColor = Colors.green;
  state.signUpTabColor = Colors.grey;
  state.pageController.animateToPage(0, duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  final LoginState newState = state.clone();
  return newState;
}
LoginState _onSignUpTab(LoginState state, Action action){
  state.signInTabColor = Colors.grey;
  state.signUpTabColor = Colors.green;
  state.pageController.animateToPage(1, duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  final LoginState newState = state.clone();
  return newState;

}
