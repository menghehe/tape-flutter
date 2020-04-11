import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:tape/api/friend_api.dart';
import 'package:tape/models/user.dart';
import 'action.dart';
import 'state.dart';

Effect<FriendState> buildEffect() {
  return combineEffects(<Object, Effect<FriendState>>{
    Lifecycle.initState:_onInit,
    FriendAction.fetchFriend: _onFetchFriend,
    FriendAction.tapeAvatar:_onTapAvatar,
  });
}

void _onInit(Action action, Context<FriendState> ctx){
  ctx.dispatch(FriendActionCreator.onFetchFriend());
}

void _onFetchFriend(Action action, Context<FriendState> ctx) {
  User param = User();
  Future future = ctx.state.type==1?FriendApi.getFollowing(param):FriendApi.getFollower(param);
  future.then((result){
    if(result.isSuccess){
      UserPage userPage = JsonMapper.fromMap(result.data);
      ctx.dispatch(FriendActionCreator.onFetchFriendSuccess(userPage));
    }else{

    }
  });
}

void _onTapAvatar(Action action, Context<FriendState> ctx){
  Navigator.of(ctx.context).pushNamed("profile",arguments: {'profileUser':action.payload});
}
