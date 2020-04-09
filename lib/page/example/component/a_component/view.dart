import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

// AActionCreator
Widget buildView(AState state, Dispatch dispatch, ViewService viewService) {
  return ListTile(title: Text("我是AAAAAAA_${state.index}"),);
}
