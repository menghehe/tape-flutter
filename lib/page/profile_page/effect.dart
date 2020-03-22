import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:tape/api/clip_api.dart';
import 'package:tape/api/user_api.dart';
import 'package:tape/models/clip.dart';
import 'package:tape/models/clip_page.dart';
import 'action.dart';
import 'state.dart';

Effect<ProfileState> buildEffect() {
  return combineEffects(<Object, Effect<ProfileState>>{
    ProfileAction.action: _onAction,
    Lifecycle.initState:_init,
    ProfileAction.fetchUserInfo:_fetchUserInfo,
    ProfileAction.fetchUserClip:_onFetchUserClip,
    ProfileAction.onRefresh: _onRefresh,
    ProfileAction.tapClipCover:_onTapClipCover,
  });
}

void _onAction(Action action, Context<ProfileState> ctx) {
}

void _init(Action action, Context<ProfileState> ctx){
  ctx.dispatch(ProfileActionCreator.fetchUserInfo());
}

void _fetchUserInfo(Action action, Context<ProfileState> ctx){
  Future userApi = UserApi.getUserInfo();
  userApi.then((result){
    if(result.isSuccess){
      ctx.dispatch(ProfileActionCreator.fetchSuccess(JsonMapper.fromMap(result.data)));
      ctx.dispatch(ProfileActionCreator.onFetchUserClip());
    }
  });

}

void _onFetchUserClip(Action action, Context<ProfileState> ctx){
  Clip clip = Clip();
  clip.creator = ctx.state.user.id;
  Map params = JsonMapper.toMap(clip,SerializationOptions(ignoreNullMembers: true));
  Future future = ClipApi.getClip(clip);
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
    }
  });
}

void _onRefresh(Action action, Context<ProfileState> ctx){
  ctx.dispatch(ProfileActionCreator.fetchUserInfo());
}

void _onTapClipCover(Action action, Context<ProfileState> ctx){
  Navigator.of(ctx.context).pushNamed("player", arguments: {'clip':action.payload});
}
