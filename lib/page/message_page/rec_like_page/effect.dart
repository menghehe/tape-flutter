import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<RecLikeState> buildEffect() {
  return combineEffects(<Object, Effect<RecLikeState>>{
    RecLikeAction.action: _onAction,
  });
}

void _onAction(Action action, Context<RecLikeState> ctx) {
}
