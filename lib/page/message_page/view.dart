import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(MessageState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Text('消息'),
    ),
    body:Center(
      child: Text('还没有消息'),
    )
  );
}



