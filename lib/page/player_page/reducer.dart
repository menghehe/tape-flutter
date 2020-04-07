import 'package:fish_redux/fish_redux.dart';
import 'package:tape/api/request/Address.dart';
import 'package:tape/models/clip.dart';
import 'package:tape/models/comment.dart';
import 'package:tape/models/like.dart';
import 'package:video_player/video_player.dart';

import 'action.dart';
import 'state.dart';

Reducer<PlayerState> buildReducer() {
  return asReducer(
    <Object, Reducer<PlayerState>>{
      PlayerAction.fetchClipSuccess:_onFetchClipSuccess,
      PlayerAction.fetchClipFailure:_onFetchClipFailure,
      PlayerAction.fetchSuccess: _onFetchSuccess,
      PlayerAction.likeSuccess:_onLikeSuccess,
    },
  );
}

PlayerState _onFetchClipSuccess(PlayerState state, Action action) {
  final PlayerState newState = state.clone();
  newState.clip = action.payload;
  newState.videoPlayerController = VideoPlayerController.network(Address.BASE_CLIP_URL+newState.clip.clipPath);
  return newState;
}

PlayerState _onFetchClipFailure(PlayerState state, Action action) {
  final PlayerState newState = state.clone();
  return newState;
}

PlayerState _onFetchSuccess(PlayerState state, Action action){
  final PlayerState newState = state.clone();
  newState.commentList = action.payload.records;
  return newState;

}

PlayerState _onLikeSuccess(PlayerState state, Action action) {
  final PlayerState newState = state.clone();
  Like like = action.payload;
  if(like.likeType==1){
    Clip clip = newState.clip;
    clip.liked = !clip.liked;
    clip.liked==true?clip.likeCount++:clip.likeCount--;
    newState.clip = clip;
  }else{
    for(var i=0;i<state.commentList.length;i++){
      if(newState.commentList[i].id==like.comment.id){
        newState.commentList[i].liked = !newState.commentList[i].liked;
        if(newState.commentList[i].liked){
          newState.commentList[i].likedCount++;
        }else{
          newState.commentList[i].likedCount--;
        }
//        newState.commentList[i].likedCount = newState.commentList[i].liked ? newState.commentList[i].likedCount++:newState.commentList[i].likedCount--;
        println(newState.commentList[i].likedCount);
      }
    }
  }
  return newState;
}

