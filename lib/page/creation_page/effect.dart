import 'dart:io';

import 'package:fish_redux/fish_redux.dart';
import 'package:image_picker/image_picker.dart';
import 'action.dart';
import 'state.dart';

Effect<CreationState> buildEffect() {
  return combineEffects(<Object, Effect<CreationState>>{
    CreationAction.action: _onAction,
    CreationAction.imageButtonPressed:_onImageButtonPressed,
  });
}

void _onAction(Action action, Context<CreationState> ctx) {
}

Future<void> _onImageButtonPressed(Action action, Context<CreationState> ctx) async {
  File file = await ImagePicker.pickVideo(source: action.payload);
  await ctx.dispatch(CreationActionCreator.onPickComplete(file));
}
