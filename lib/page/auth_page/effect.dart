import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tape/api/user_api.dart';
import 'package:tape/utils/storage.dart';
import 'action.dart';
import 'state.dart';

Effect<AuthState> buildEffect() {
  return combineEffects(<Object, Effect<AuthState>>{
    AuthAction.loginSuccess: _onLoginSuccess,
    AuthAction.signUpSuccess: _onSignUpSuccess,
    AuthAction.complete:_onCompleted,
  });
}

void _onLoginSuccess(Action action, Context<AuthState> ctx) {
  Storage.setString('token', action.payload);
  Navigator.of(ctx.context).pushReplacementNamed("main",arguments: {
    'pageList':ctx.state.pageList
  });
}

void _onSignUpSuccess(Action action, Context<AuthState> ctx) {
  Fluttertoast.showToast(msg: "注册成功");
  Navigator.of(ctx.context).pushReplacementNamed("auth",arguments: {
    'pageList':ctx.state.pageList
  });
}


void _onCompleted(Action action, Context<AuthState> ctx){
  Navigator.of(ctx.context).pushReplacementNamed("main",arguments: {
    'pageList':ctx.state.pageList
  });
}
