import 'package:fish_redux/fish_redux.dart';


class BState implements Cloneable<BState> {

  int index;

  @override
  BState clone() {
    return BState()..index=this.index;
  }
}

BState initState(BState initState) {
  return initState ?? BState();
}
