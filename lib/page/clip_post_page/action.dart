import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ClipPostAction { post }

class ClipPostActionCreator {
  static Action onPost() {
    return const Action(ClipPostAction.post);
  }
}
