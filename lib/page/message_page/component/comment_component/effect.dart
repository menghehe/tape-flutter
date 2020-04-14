import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:tape/api/comment_api.dart';
import 'package:tape/models/base.dart';
import 'package:tape/models/comment.dart';
import 'action.dart';
import 'state.dart';

Effect<CommentState> buildEffect() {
  return combineEffects(<Object, Effect<CommentState>>{
    Lifecycle.initState:_onInit,
    CommentAction.fetchComment: _onFetchComment,
    CommentAction.tapComment:_onTapComment,
    CommentAction.tapAvatar:_onTapAvatar,
  });
}

void _onInit(Action action, Context<CommentState> ctx){
  ctx.dispatch(CommentActionCreator.onFetchComment());
}

void _onFetchComment(Action action, Context<CommentState> ctx) {
  Comment comment = Comment();
  OrderItem orderItem = OrderItem("create_time", false);
  comment.orders = [orderItem];
  comment.size = 500;
  comment.current = 1;
  Future future = CommentApi.getToMe(comment);
  future.then((result){
    if(result.isSuccess){
      CommentPage commentPage = JsonMapper.fromMap(result.data);
      ctx.dispatch(CommentActionCreator.onFetchSuccess(commentPage));
    }else{
      ctx.dispatch(CommentActionCreator.onFetchFailure());
    }
  });
}


void _onTapComment(Action action, Context<CommentState> ctx) {
  Navigator.of(ctx.context).pushNamed("player",arguments: {"clipId":action.payload.clipId});

}

void _onTapAvatar(Action action, Context<CommentState> ctx) {
  Navigator.of(ctx.context).pushNamed("profile",arguments: {"profileUser":action.payload.user});
}
