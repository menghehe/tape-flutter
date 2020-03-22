import 'package:fish_redux/fish_redux.dart';

class ClipCoverListState implements Cloneable<ClipCoverListState> {

  @override
  ClipCoverListState clone() {
    return ClipCoverListState();
  }
}

ClipCoverListState initState(Map<String, dynamic> args) {
  return ClipCoverListState();
}
