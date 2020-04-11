import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:tape/api/clip_api.dart';
import 'package:tape/api/user_api.dart';
import 'package:tape/models/clip.dart';
import 'package:tape/utils/storage.dart';
import '../../app.dart';
import '../../main.reflectable.dart';
import 'action.dart';
import 'state.dart';

Effect<MineState> buildEffect() {
  return combineEffects(<Object, Effect<MineState>>{
    Lifecycle.initState: _init,
    MineAction.fetchUserInfo: _fetchUserInfo,
    MineAction.fetchUserClip: _onFetchUserClip,
    MineAction.onRefresh: _onRefresh,
    MineAction.tapClipCover: _onTapClipCover,
    MineAction.tapFollowing:_onTapFollowing,
    MineAction.tapFollower:_onTapFollower,
    MineAction.logout: _onLogout,
  });
}

void _init(Action action, Context<MineState> ctx) {
  ctx.dispatch(MineActionCreator.fetchUserInfo());
}

void _fetchUserInfo(Action action, Context<MineState> ctx) {
  Future userApi = UserApi.getUserInfo(null);
  userApi.then((result) {
    if (result.isSuccess) {
      ctx.dispatch(MineActionCreator.fetchUserInfoSuccess(
          JsonMapper.fromMap(result.data)));
      ctx.dispatch(MineActionCreator.onFetchUserClip());
    } else {
      ctx.dispatch(MineActionCreator.fetchUserInfoFailure());
    }
  });
}

void _onFetchUserClip(Action action, Context<MineState> ctx) {
  Clip clip = Clip();
  clip.creator = ctx.state.user.id;
  Future future = ClipApi.getClip(clip);
  future.then((result) {
    if (result.isSuccess) {
      JsonMapper().useAdapter(JsonMapperAdapter(valueDecorators: {
        typeOf<List<Clip>>(): (value) => value.cast<Clip>(),
      }));
      ClipPage clipPage = ClipPage();
      clipPage = JsonMapper.fromMap(result.data);
      ctx.dispatch(MineActionCreator.fetchUserClipSuccess(clipPage));
    } else {
      ctx.dispatch(MineActionCreator.fetchUserClipFailure());
    }
  });
}

void _onRefresh(Action action, Context<MineState> ctx) {
  ctx.dispatch(MineActionCreator.onFetchUserClip());
}

void _onTapClipCover(Action action, Context<MineState> ctx) {
  Navigator.of(ctx.context)
      .pushNamed("player", arguments: {'clip': action.payload});
}

void _onLogout(Action action, Context<MineState> ctx) {
  showDialog(
    context: ctx.context,
    child: new AlertDialog(
      title: new Text('警告'),
      content: new Text('确定退出登录吗？'),
      actions: <Widget>[
        new FlatButton(
            onPressed: () {
              Navigator.pop(ctx.context, 'Cancel');
            },
            child: const Text('取消')),
        new FlatButton(
          onPressed: () {
            Storage.remove("token");
            Navigator.pop(ctx.context, 'Cancel');
            WidgetsFlutterBinding.ensureInitialized();
            initializeReflectable();
            runApp(createApp("login"));
          },
          child: const Text('确定'),
        ),
      ],
    ),
  );
}

void _onTapFollowing(Action action, Context<MineState> ctx) {
  Navigator.of(ctx.context).pushNamed("friend", arguments: {'type':1});
}

void _onTapFollower(Action action, Context<MineState> ctx) {
  Navigator.of(ctx.context).pushNamed("friend", arguments: {'type':2});
}
