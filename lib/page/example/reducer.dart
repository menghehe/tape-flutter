import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ExampleState> buildReducer() {
  return asReducer(
    <Object, Reducer<ExampleState>>{
      ExampleAction.modify: _modify,
    },
  );
}

ExampleState _modify(ExampleState state, Action action) {
  final modifyFunc=action.payload as void Function(ExampleState clone);
  final clone = state.clone();
  modifyFunc(clone);
  assert(state.hashCode != clone.hashCode); //不能是相同的对象
  return clone;
}
