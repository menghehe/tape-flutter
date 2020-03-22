import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ClipCoverAction { action ,tapPlayer}

class ClipCoverActionCreator {
  static Action onAction() {
    return const Action(ClipCoverAction.action);
  }

  static Action tapPlayer(){
    return const Action(ClipCoverAction.tapPlayer);
  }
}
