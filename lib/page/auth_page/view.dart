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



  Future<String> _onLogin(LoginData loginData){
    Future future = UserApi.login(loginData.name, loginData.password);
    return future.then((result){
      if(result.isSuccess){
        dispatch(AuthActionCreator.onLoginSuccess(result.data['token']));
        return null;
      }else{
        return result.message;
      }
    });
  }

  Future<String> _onSignUp(LoginData loginData) {
    Future future = UserApi.signUp(loginData.name, loginData.password);
    return future.then((result){
      if(result.isSuccess){
        dispatch(AuthActionCreator.onSignUpSuccess());
        return null;
      }else{
        return result.message;
      }
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
       recoverPasswordButton: '找回密码',
       goBackButton: '返回',
       confirmPasswordError: '两次密码不一致',
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
      return _onLogin(loginData);
    },
    onSignup: (loginData) {
      return _onSignUp(loginData);
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
