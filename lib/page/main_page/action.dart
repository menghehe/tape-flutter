import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum MainAction { action,onPressTab }

class MainActionCreator {
  static Action onAction() {
    return const Action(MainAction.action);
  }

  static Action onPressTab(int index){
    return Action(MainAction.onPressTab, payload: index);
  }
}
