import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<ClipCoverState> buildEffect() {
  return combineEffects(<Object, Effect<ClipCoverState>>{
    ClipCoverAction.tapUserAvatar: _onTapUserAvatar,
    ClipCoverAction.tapPlayer: _onTapPlayer,
  });
}

void _onTapUserAvatar(Action action, Context<ClipCoverState> ctx) {
  Navigator.of(ctx.context).pushNamed("profile",arguments: {"profileUser":ctx.state.clip.user});
}

void _onTapPlayer(Action action, Context<ClipCoverState> ctx){
  Navigator.of(ctx.context).pushNamed("player",arguments: {"clip":ctx.state.clip});
}
