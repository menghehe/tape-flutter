import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MessageState> buildReducer() {
  return asReducer(
    <Object, Reducer<MessageState>>{
    },
  );
}

MessageState _modify(MessageState state, Action action) {
  final modifyFunc=action.payload as void Function(MessageState clone);
  final clone = state.clone();
  modifyFunc(clone);
  assert(state.hashCode != clone.hashCode); //不能是相同的对象
  return clone;
}
