import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<MessageState> buildEffect() {
  return combineEffects(<Object, Effect<MessageState>>{
    Lifecycle.initState: _initState,
  });
}

void _initState(Action action, Context<MessageState> ctx) {
  TabController tabController = TabController(length: 2, vsync: (ctx.stfState as TickerProvider));
  ctx.state.tabController = tabController;
}
