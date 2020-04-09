import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<ExampleState> buildEffect() {
  return combineEffects(<Object, Effect<ExampleState>>{
    Lifecycle.initState: _initState,
  });
}

void _initState(Action action, Context<ExampleState> ctx) {
  TabController tabController = TabController(length: 2, vsync: (ctx.stfState as TickerProvider));
  ctx.dispatch(ExampleActionCreator.modify((clone){
    clone.tabController=tabController;
  }));
  tabController.addListener((){
    ctx.dispatch(ExampleActionCreator.modify((clone){
      clone.select=tabController.index==0?"A":"B";
    }));
  });
}
