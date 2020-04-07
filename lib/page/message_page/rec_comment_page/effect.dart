import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:tape/api/comment_api.dart';
import 'package:tape/models/comment.dart';
import 'action.dart';
import 'state.dart';

Effect<RecCommentState> buildEffect() {
  return combineEffects(<Object, Effect<RecCommentState>>{
    RecCommentAction.fetchComment: _onFetchComment,
    RecCommentAction.tapComment:_onTapComment,
    RecCommentAction.tapAvatar:_onTapAvatar,
  });
}

void _onFetchComment(Action action, Context<RecCommentState> ctx) {
  Comment comment = Comment();
  Future future = CommentApi.getToMe(comment);
  future.then((result){
    if(result.isSuccess){
      CommentPage commentPage = JsonMapper.fromMap(result.data);
      ctx.dispatch(RecCommentActionCreator.onFetchSuccess(commentPage));
    }else{
      ctx.dispatch(RecCommentActionCreator.onFetchFailure());
    }
  });
}


void _onTapComment(Action action, Context<RecCommentState> ctx) {
  Navigator.of(ctx.context).pushNamed("player",arguments: {"clipId":action.payload.clipId});

}

void _onTapAvatar(Action action, Context<RecCommentState> ctx) {
  Navigator.of(ctx.context).pushNamed("profile",arguments: {"profileUser":action.payload.user});
}
