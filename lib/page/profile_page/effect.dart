import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:tape/api/clip_api.dart';
import 'package:tape/api/friend_api.dart';
import 'package:tape/api/user_api.dart';
import 'package:tape/models/clip.dart';

import 'action.dart';
import 'state.dart';

Effect<ProfileState> buildEffect() {
  return combineEffects(<Object, Effect<ProfileState>>{
    Lifecycle.initState:_init,
    ProfileAction.fetchUserInfo:_fetchUserInfo,
    ProfileAction.fetchUserClip:_onFetchUserClip,
    ProfileAction.onRefresh: _onRefresh,
    ProfileAction.tapClipCover:_onTapClipCover,
    ProfileAction.tapFriendShip:_onTapFriendShip,
  });
}


void _init(Action action, Context<ProfileState> ctx){
  ctx.dispatch(ProfileActionCreator.fetchUserInfo());
  ctx.dispatch(ProfileActionCreator.onFetchUserClip());
}

void _fetchUserInfo(Action action, Context<ProfileState> ctx){
  Future userApi = UserApi.getUserInfo(ctx.state.profileUser.username);
  userApi.then((result){
    if(result.isSuccess){
      ctx.dispatch(ProfileActionCreator.fetchUserInfoSuccess(JsonMapper.fromMap(result.data)));
    }else{
      ctx.dispatch(ProfileActionCreator.fetchUserInfoFailure());
    }
  });

}

void _onFetchUserClip(Action action, Context<ProfileState> ctx){
  Clip clip = Clip();
  clip.creator = ctx.state.profileUser.id;
  Future future = ClipApi.listClip(clip);
  future.then((result){
    if(result.isSuccess){
      JsonMapper().useAdapter(JsonMapperAdapter(
          valueDecorators: {
            typeOf<List<Clip>>(): (value) => value.cast<Clip>(),
          })
      );
      ClipPage clipPage = ClipPage();
      clipPage = JsonMapper.fromMap(result.data);
      ctx.dispatch(ProfileActionCreator.fetchUserClipSuccess(clipPage));
    }else{
      ctx.dispatch(ProfileActionCreator.fetchUserClipFailure());
    }
  });
}

void _onRefresh(Action action, Context<ProfileState> ctx){
  ctx.dispatch(ProfileActionCreator.onFetchUserClip());
  ctx.dispatch(ProfileActionCreator.onFetchUserClip());
}

void _onTapClipCover(Action action, Context<ProfileState> ctx){
  Navigator.of(ctx.context).pushNamed("player", arguments: {'clip':action.payload});
}


void _onTapFriendShip(Action action, Context<ProfileState> ctx){
  if(ctx.state.profileUser.friendShipStatus==0){
    Future future = FriendApi.createFollow(ctx.state.profileUser.id);
    future.then((result){
      if(result.isSuccess){
        ctx.dispatch(ProfileActionCreator.fetchUserInfo());
      }
    });
  }else{
    Future future = FriendApi.destroyFollow(ctx.state.profileUser.id);
    future.then((result){
      if(result.isSuccess){
        ctx.dispatch(ProfileActionCreator.fetchUserInfo());
      }
    });
  }
}
