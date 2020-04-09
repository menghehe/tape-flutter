import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<MessageState> buildEffect() {
  return combineEffects(<Object, Effect<MessageState>>{
    Lifecycle.initState:_onInit,
  });
}

void _onInit(Action action, Context<MessageState> ctx) {
  ctx.state.tabController = TabController(length: 2, vsync: (ctx.stfState as TickerProvider));
}
