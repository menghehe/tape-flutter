import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<ClipCoverState> buildEffect() {
  return combineEffects(<Object, Effect<ClipCoverState>>{
    ClipCoverAction.action: _onAction,
    ClipCoverAction.tapPlayer: _onTapPlayer,
  });
}

void _onAction(Action action, Context<ClipCoverState> ctx) {
}

void _onTapPlayer(Action action, Context<ClipCoverState> ctx){
  Navigator.of(ctx.context).pushNamed("player",arguments: {"clip":ctx.state.clip,"vc":ctx.state.videoPlayerController});
}
