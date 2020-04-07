import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_login/flutter_login.dart';

//TODO replace with your own action
enum AuthAction { login ,signUp,complete}

class AuthActionCreator {
  static Action onLogin(LoginData loginData) {
    return  Action(AuthAction.login,payload: loginData);
  }

  static Action onSignUp(LoginData loginData) {
    return  Action(AuthAction.signUp,payload: loginData);
  }

  static Action onComplete() {
    return const  Action(AuthAction.complete);
  }
}
