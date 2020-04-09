import 'package:fish_redux/fish_redux.dart';
import 'state.dart';


enum BAction { modify }

class BActionCreator {
  static Action modify(void Function(BState clone) modifyFunc) {
    return  Action(BAction.modify,payload: modifyFunc);
  }
}
