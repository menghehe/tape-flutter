import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum FriendAction { action }

class FriendActionCreator {
  static Action onAction() {
    return const Action(FriendAction.action);
  }
}
