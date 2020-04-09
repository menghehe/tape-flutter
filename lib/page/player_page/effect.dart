import 'dart:math';

import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/services.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:tape/api/clip_api.dart';
import 'package:tape/api/comment_api.dart';
import 'package:tape/api/like_api.dart';
import 'package:tape/models/comment.dart';
import 'package:tape/models/like.dart';

import 'action.dart';
import 'state.dart';

Effect<PlayerState> buildEffect() {
  return combineEffects(<Object, Effect<PlayerState>>{
    Lifecycle.initState:_init,
    Lifecycle.dispose:_dispose,
    PlayerAction.fetchClip: _onFetchClip,
    PlayerAction.fetchComment: _onFetchComment,
    PlayerAction.addComment:_onAddComment,
    PlayerAction.tapLike: _onTapLike,
  });
}

void _init(Action action, Context<PlayerState> ctx){
  if(ctx.state.clip==null){
    ctx.dispatch(PlayerActionCreator.onFetchClip());
  }
  ctx.state.clip.viewCount = Random.secure().nextInt(1000);
  ctx.state.clip.shareCount = Random.secure().nextInt(100);
  ctx.state.clip.collectCount = Random.secure().nextInt(10);
  ctx.dispatch(PlayerActionCreator.onFetchComment());
}



void _dispose(Action action, Context<PlayerState> ctx){
  SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.top, SystemUiOverlay.bottom]);
}



void _onFetchClip(Action action, Context<PlayerState> ctx) {
  Future future = ClipApi.showClip(ctx.state.clipId.toString());
  future.then((result){
    if(result.isSuccess){
      ctx.dispatch(PlayerActionCreator.onFetchClipSuccess(JsonMapper.fromMap(result.data)));
    }
  });
}

void _onFetchComment(Action action,Context<PlayerState> ctx){
  Comment comment = Comment();
  if(ctx.state.clip==null){
    comment.clipId = ctx.state.clipId;
  }else{
    comment.clipId = ctx.state.clip.id;
  }
  Future future = CommentApi.getComment(comment);
  future.then((result){
    if(result.isSuccess){
      JsonMapper().useAdapter(JsonMapperAdapter(
          valueDecorators: {
            typeOf<List<Comment>>(): (value) => value.cast<Comment>(),
          })
      );
      CommentPage commentPage = CommentPage();
      commentPage = JsonMapper.fromMap(result.data);
      ctx.dispatch(PlayerActionCreator.onFetchSuccess(commentPage));
    }
  });
}

void _onAddComment(Action action,Context<PlayerState> ctx){
  if(ctx.state.commentEditController.text.length==0){
    return;
  }
  ProgressDialog progressDialog = ProgressDialog(ctx.context,type: ProgressDialogType.Normal, isDismissible: true, showLogs: true);
  progressDialog.show();

  Comment comment = Comment();
  comment.clipId = ctx.state.clip.id;
  comment.text = ctx.state.commentEditController.text;
  comment.toId = ctx.state.clip.user.id;

  Future future = CommentApi.postComment(comment);
  future.then((result){
    if(result.isSuccess){
      ctx.state.commentEditController.text=null;
      ctx.dispatch(PlayerActionCreator.onFetchComment());
      progressDialog.dismiss();
      ctx.state.commentEditController.clear();
      ctx.state.commentFocusNode.unfocus();
    }else{
      progressDialog.dismiss();

    }
  });

}

void _onTapLike(Action action,Context<PlayerState> ctx){
  Like like = action.payload;
  Like param = Like();
  param.targetId = like.targetId;
  param.likeType = like.likeType;
  param.toId = like.toId;
  if(like.likeType==1){
    ctx.state.clip.liked?LikeApi.destroyLike(param):LikeApi.createLike(param);
  }
  if(like.likeType==2){
    like.comment.liked?LikeApi.destroyLike(param):LikeApi.createLike(param);
  }
  ctx.dispatch(PlayerActionCreator.onLikeSuccess(like));
}
