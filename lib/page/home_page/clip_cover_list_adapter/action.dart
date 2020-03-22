import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ClipCoverListAction { action }

class ClipCoverListActionCreator {
  static Action onAction() {
    return const Action(ClipCoverListAction.action);
  }
}
