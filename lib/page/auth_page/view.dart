import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tape/api/user_api.dart';
import 'package:tape/utils/storage.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(AuthState state, Dispatch dispatch, ViewService viewService) {

var loginTime = Duration(milliseconds: timeDilation.ceil() * 2250);


  Future<String> _recoverPassword(String name) {
    return Future.delayed(loginTime).then((_) {
//      if (!mockUsers.containsKey(name)) {
//        return 'Username not exists';
//      }
      return null;
    });
  }


  return FlutterLogin(
    title: "Tape",
    logo: 'assets/images/ecorp.png',
     messages: LoginMessages(
       usernameHint: '用户名',
       passwordHint: '密码',
       confirmPasswordHint: '确认密码',
       loginButton: '登录',
       signupButton: '注册',
       forgotPasswordButton: '忘记密码?',
       recoverPasswordButton: 'HELP ME',
       goBackButton: 'GO BACK',
       confirmPasswordError: 'Not match!',
       recoverPasswordIntro: 'Don\'t feel bad. Happens all the time.',
       recoverPasswordDescription: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
       recoverPasswordSuccess: 'Password rescued successfully',
     ),
    emailValidator: (value) {
//      if (!value.contains('@') || !value.endsWith('.com')) {
//        return "Email must contain '@' and end with '.com'";
//      }
        if(value.length<4){
          return '用户名不能小于四位';
        }
      return null;
    },
    passwordValidator: (value) {
      if (value.isEmpty) {
        return '密码不能为空';
      }
      if(value.length<6){
        return '密码不能小于六位';
      }
      return null;
    },
    onLogin: (loginData) {
      return dispatch(AuthActionCreator.onLogin(loginData));
    },
    onSignup: (loginData) {
      return dispatch(AuthActionCreator.onSignUp(loginData));
    },
    onRecoverPassword: (name) {
      return Future.delayed(Duration(seconds: 1),(){
        return '然而并不能找回';
      });
    },

    onSubmitAnimationCompleted: () {
//      dispatch(AuthActionCreator.onComplete());
    },
    showDebugButtons: false,
  );
}
