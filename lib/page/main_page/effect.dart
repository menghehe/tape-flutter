import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:jpush_flutter/jpush_flutter.dart';
import 'package:tape/api/user_api.dart';
import 'package:tape/models/user.dart';
import 'package:tape/utils/storage.dart';

import 'state.dart';

Effect<MainState> buildEffect() {
  return combineEffects(<Object, Effect<MainState>>{
    Lifecycle.initState: _init,
  });
}

void _init(Action action, Context<MainState> ctx) {
  void initPush(User user){
    JPush jpush = new JPush();
    jpush.setAlias(user.id.toString()).then((result){
    });
    jpush.setup(appKey: "d5e56f164a1b0020a28a6458" ,channel: 'developer-default');
    // 监听jpush
    jpush.addEventHandler(
      onReceiveNotification: (Map<String, dynamic> message) async {
        print("flutter 接收到推送: $message");
      },
      // ignore: missing_return
      onOpenNotification: (Map<String, dynamic> message) {
        println("");
      },
    );
  }

  Future future = UserApi.getUserInfo(null);
  future.then((result){
    if(result.isSuccess){
      User user = JsonMapper.fromMap(result.data);
      Storage.setString("user", JsonMapper.toJson(user));
      initPush(user);
    }else{
    }
  });
}



