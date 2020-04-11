import 'package:fish_redux/fish_redux.dart';
import 'package:tape/models/user.dart';

enum FriendAction {
  fetchFriend,
  fetchFriendSuccess,
  fetchFriendFailure,
  tapeAvatar,
}

class FriendActionCreator {
  static Action onFetchFriend() {
    return const Action(FriendAction.fetchFriend);
  }

  static Action onFetchFriendSuccess(UserPage userPage) {
    return Action(FriendAction.fetchFriendSuccess,payload: userPage);
  }

  static Action onFetchFriendFailure() {
    return const Action(FriendAction.fetchFriendFailure);
  }

  static Action onTapAvatar(User user) {
    return Action(FriendAction.tapeAvatar,payload: user);
  }
}
