import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum RecLikeAction { action }

class RecLikeActionCreator {
  static Action onAction() {
    return const Action(RecLikeAction.action);
  }
}
