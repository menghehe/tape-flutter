import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tape/api/user_api.dart';
import 'package:tape/utils/storage.dart';
import 'action.dart';
import 'state.dart';

Effect<AuthState> buildEffect() {
  return combineEffects(<Object, Effect<AuthState>>{
    AuthAction.login: _onLogin,
    AuthAction.signUp: _onSignUp,
    AuthAction.complete:_onCompleted,
  });
}

Future<String> _onLogin(Action action, Context<AuthState> ctx) {
  Future<dynamic> data =
      UserApi.login(action.payload.name, action.payload.password);
  return data.then((result) async {
    if (result.isSuccess) {
      Storage.setString('token', result.data["token"]);
      Navigator.of(ctx.context).pushReplacementNamed("main",arguments: {
        'pageList':ctx.state.pageList
      });
      return null;
    } else {
      return '发生错误';
    }
  });
}

Future<String> _onSignUp(Action action, Context<AuthState> ctx) {
  Future<dynamic> data =
  UserApi.signUp(action.payload.name, action.payload.password);
  return data.then((result) async {
    if (result.isSuccess) {
//      ctx.dispatch(AuthActionCreator.onLogin(action.payload));
      Fluttertoast.showToast(msg: "注册成功，请登录");
      Navigator.of(ctx.context).pushReplacementNamed("auth",arguments: {
        'pageList':ctx.state.pageList
      });
      return null;
    } else {
      return '发生错误';
    }
  });
}


void _onCompleted(Action action, Context<AuthState> ctx){
  Navigator.of(ctx.context).pushReplacementNamed("main",arguments: {
    'pageList':ctx.state.pageList
  });
}
