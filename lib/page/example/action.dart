import 'package:fish_redux/fish_redux.dart';
import 'state.dart';


enum ExampleAction { modify }

class ExampleActionCreator {
  static Action modify(void Function(ExampleState clone) modifyFunc) {
    return  Action(ExampleAction.modify,payload: modifyFunc);
  }
}
