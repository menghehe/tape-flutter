import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:tape/api/comment_api.dart';
import 'package:tape/models/comment.dart';
import 'package:tape/models/comment_page.dart';

import 'action.dart';
import 'state.dart';

Effect<PlayerState> buildEffect() {
  return combineEffects(<Object, Effect<PlayerState>>{
    PlayerAction.action: _onAction,
    PlayerAction.fetchComment: _onFetchComment,
    Lifecycle.initState:_init,
    PlayerAction.addComment:_onAddComment,
  });
}

void _init(Action action, Context<PlayerState> ctx){
  ctx.dispatch(PlayerActionCreator.onFetchComment());
}

void _onAction(Action action, Context<PlayerState> ctx) {
}

void _onFetchComment(Action action,Context<PlayerState> ctx){
  Comment comment = Comment();
  comment.clipId = ctx.state.clip.id;
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
  Comment comment = Comment();
  comment.clipId = ctx.state.clip.id;
  comment.text = ctx.state.commentEditController.text;
  Map map = JsonMapper.toMap(comment,SerializationOptions(ignoreNullMembers: true));

  Future future = CommentApi.postComment(comment);
  future.then((result){
    if(result.isSuccess){
      ctx.state.commentEditController.text=null;
      ctx.dispatch(PlayerActionCreator.onFetchComment());
    }
  });

}
