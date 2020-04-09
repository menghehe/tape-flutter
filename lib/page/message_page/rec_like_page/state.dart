import 'package:fish_redux/fish_redux.dart';

class RecLikeState implements Cloneable<RecLikeState> {

  @override
  RecLikeState clone() {
    return RecLikeState();
  }
}

RecLikeState initState(Map<String, dynamic> args) {
  return RecLikeState();
}
