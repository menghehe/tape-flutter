import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:tape/api/clip_api.dart';
import 'package:tape/models/base.dart';
import 'package:tape/models/clip.dart';
import 'action.dart';
import 'state.dart';

Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    Lifecycle.initState:_init,
    HomeAction.fetchRecommend: _fetchRecommend,
    HomeAction.refresh:_refresh,
    HomeAction.loadMore:_loadMore

  });
}
void _init(Action action, Context<HomeState> ctx) {
  ctx.dispatch(HomeActionCreator.fetchRecommend());
}

void _fetchRecommend(Action action, Context<HomeState> ctx) {
  Future<dynamic> data =  ClipApi.listClip(ctx.state.clipParam);
  println(data);
  data.then((result){
    if(result.isSuccess){
      ctx.dispatch(HomeActionCreator.fetchSuccess(JsonMapper.fromMap(result.data)));
    }else{
      ctx.dispatch(HomeActionCreator.fetchFailure());
    }
  });
}


Future<bool> _refresh(Action action, Context<HomeState> ctx) {
  Clip clipParam = Clip();
  OrderItem orderItem = OrderItem("create_time", false);
  clipParam.orders = [orderItem];
  clipParam.current = 1;
  clipParam.size = 4;

  ctx.state.clipParam = clipParam;
  Future<dynamic> data =  ClipApi.listClip(ctx.state.clipParam);
  println(data);
  return data.then((result){
    if(result.isSuccess){
      ctx.dispatch(HomeActionCreator.fetchSuccess(JsonMapper.fromMap(result.data)));
    }else{
      ctx.dispatch(HomeActionCreator.fetchFailure());
    }
    return true;
  });
}

void _loadMore(Action action,Context<HomeState> ctx){
  Clip clipParam = ctx.state.clipParam;
  OrderItem orderItem = OrderItem("create_time", false);
  clipParam.orders = [orderItem];
  clipParam.current = clipParam.current+1;

  ctx.state.clipParam = clipParam;
  Future<dynamic> data =  ClipApi.listClip(clipParam);
  println(data);
  data.then((result){
    if(result.isSuccess){
      ctx.dispatch(HomeActionCreator.loadSuccess(JsonMapper.fromMap(result.data)));
    }else{
      ctx.dispatch(HomeActionCreator.loadFailure());
    }
  });
}

