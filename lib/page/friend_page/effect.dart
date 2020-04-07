import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<FriendState> buildEffect() {
  return combineEffects(<Object, Effect<FriendState>>{
    FriendAction.action: _onAction,
  });
}

void _onAction(Action action, Context<FriendState> ctx) {
}
