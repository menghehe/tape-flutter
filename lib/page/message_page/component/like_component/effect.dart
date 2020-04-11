import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:tape/api/like_api.dart';
import 'package:tape/models/comment.dart';
import 'package:tape/models/like.dart';
import 'action.dart';
import 'state.dart';

Effect<LikeState> buildEffect() {
  return combineEffects(<Object, Effect<LikeState>>{
    Lifecycle.initState:_onInit,
    LikeAction.fetchLike: _onFetchLike,
    LikeAction.tapContent:_onTapContent,
    LikeAction.tapAvatar:_onTapAvatar,
  });
}

void _onInit(Action action, Context<LikeState> ctx){
  ctx.dispatch(LikeActionCreator.onFetchLike());
}

void _onFetchLike(Action action, Context<LikeState> ctx) {
  Like like = Like();
  Future future = LikeApi.getToMe(like);
  future.then((result){
    if(result.isSuccess){
      LikePage likePage = JsonMapper.fromMap(result.data);
      ctx.dispatch(LikeActionCreator.onFetchSuccess(likePage));
    }else{
      ctx.dispatch(LikeActionCreator.onFetchFailure());
    }
  });
}


void _onTapContent(Action action, Context<LikeState> ctx) {
//  Navigator.of(ctx.context).pushNamed("player",arguments: {"clipId":action.payload.clipId});
}

void _onTapAvatar(Action action, Context<LikeState> ctx) {
  Navigator.of(ctx.context).pushNamed("profile",arguments: {"profileUser":action.payload.user});
}
