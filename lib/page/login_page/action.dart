import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum LoginAction { signUp,onLogin,signUpTab,signInTab,pageChanged }

class LoginActionCreator {
  static Action onSignUp() {
    return const Action(LoginAction.signUp);
  }
  static Action onLogin(){
    return const Action(LoginAction.onLogin);
  }
  static Action onSignUpTab(){
    return const Action(LoginAction.signUpTab);
  }
  static Action onSignInTab(){
    return const Action(LoginAction.signInTab);
  }
  static Action onPageChanged(){
    return const Action(LoginAction.pageChanged);
  }
}
