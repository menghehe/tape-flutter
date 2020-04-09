import 'package:fish_redux/fish_redux.dart';
import 'state.dart';


enum AAction { modify }

class AActionCreator {
  static Action modify(void Function(AState clone) modifyFunc) {
    return  Action(AAction.modify,payload: modifyFunc);
  }
}
