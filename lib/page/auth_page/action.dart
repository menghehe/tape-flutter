import 'package:fish_redux/fish_redux.dart';

enum AuthAction { loginSuccess, signUpSuccess, complete }

class AuthActionCreator {
  static Action onLoginSuccess(String token) {
    return Action(AuthAction.loginSuccess, payload: token);
  }

  static Action onSignUpSuccess() {
    return const Action(AuthAction.signUpSuccess);
  }

  static Action onComplete() {
    return const Action(AuthAction.complete);
  }
}
