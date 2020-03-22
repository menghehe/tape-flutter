import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:tape/api/clip_api.dart';
import 'package:tape/models/clip.dart';
import 'action.dart';
import 'state.dart';

Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    HomeAction.add: _onAdd,
    Lifecycle.initState:_init,
    HomeAction.fetchRecommend: _fetchRecommend,
    HomeAction.refresh:_refresh

  });
}
void _init(Action action, Context<HomeState> ctx) {
  ctx.dispatch(HomeActionCreator.fetchRecommend());
}

void _fetchRecommend(Action action, Context<HomeState> ctx) {
  Future<dynamic> data =  ClipApi.getRecommend();
  println(data);
  data.then((result){
    if(result.isSuccess){
      List<Clip> clipList = List();
      for(var i=0;i<result.data.length;i++){
        clipList.add(JsonMapper.fromMap(result.data[i]));
      }
      ctx.dispatch(HomeActionCreator.fetchSuccess(clipList));
    }
  });
}

void _onAdd(Action action, Context<HomeState> ctx){
  Navigator.of(ctx.context).pushNamed("clipRecord");
}

Future<bool> _refresh(Action action, Context<HomeState> ctx) {
  Future<dynamic> data =  ClipApi.getRecommend();
  println(data);
  return data.then((result){
    if(result.isSuccess){
      List<Clip> clipList = List();
      for(var i=0;i<result.data.length;i++){
        clipList.add(JsonMapper.fromMap(result.data[i]));
      }
      ctx.dispatch(HomeActionCreator.fetchSuccess(clipList));
    }
    return true;
  });
}

void _loadMore(Action action,Context<HomeState> ctx){
  Future<dynamic> data =  ClipApi.getRecommend();
  println(data);
  data.then((result){
    if(result.isSuccess){
//      ctx.dispatch(HomeActionCreator.loadMore(ClipList.fromJson(result.data)));
    }
    return true;
  });
}

