import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

// BActionCreator
Widget buildView(BState state, Dispatch dispatch, ViewService viewService) {
  return ListTile(title: Text("我是BBBBBBB_${state.index}"),);
}
