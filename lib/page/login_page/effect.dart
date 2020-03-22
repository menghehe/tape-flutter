import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tape/api/user_api.dart';
import 'action.dart';
import 'state.dart';
import 'package:shared_preferences/shared_preferences.dart';


Effect<LoginState> buildEffect() {
  return combineEffects(<Object, Effect<LoginState>>{
    LoginAction.onLogin:_onLogin,
    LoginAction.signUp:_onSignUp,
  });
}


void _onLogin(Action action,Context<LoginState> ctx)  {
 Future<dynamic> data = UserApi.login(ctx.state.usernameEditController.text,ctx.state.passwordEditController.text);
 data.then((result){
   if(result.isSuccess){
     saveToken(result.data["token"]);
     Navigator.of(ctx.context).pushReplacementNamed("tab",arguments: {
       'pageList':ctx.state.pageList
     });
   }
 });

}

Future<void> saveToken(String token) async {
  var prefs = await SharedPreferences.getInstance();
  prefs.setString("token", token);
}

void _onSignUp(Action action,Context<LoginState> ctx){
  Future<dynamic> data = UserApi.signUp(ctx.state.newUsernameEditController.text,ctx.state.newPasswordEditController.text);
  data.then((result){
    if(result.isSuccess){
      Fluttertoast.showToast(msg: "注册成功");
      ctx.dispatch(LoginActionCreator.onSignInTab());
    }
  });
}
