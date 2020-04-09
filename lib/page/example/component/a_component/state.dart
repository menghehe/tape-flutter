import 'package:fish_redux/fish_redux.dart';


class AState implements Cloneable<AState> {

  int index;

  @override
  AState clone() {
    return AState()..index=this.index;
  }
}

AState initState(AState initState) {
  return initState ?? AState();
}
