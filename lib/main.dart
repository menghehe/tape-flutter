import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:flutter/material.dart';
import 'package:tape/app.dart';
import 'package:tape/utils/storage.dart';

import 'main.reflectable.dart' show initializeReflectable;
import 'models/comment.dart';
import 'models/like.dart';
import 'models/user.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeReflectable();
  JsonMapper().useAdapter(JsonMapperAdapter(
      valueDecorators: {
        typeOf<List<Comment>>(): (value) => value.cast<Comment>(),
        typeOf<List<Like>>(): (value) => value.cast<Like>(),
        typeOf<List<User>>(): (value) => value.cast<User>(),
      })
  );
  Future<String> future = Storage.getString("token");
  future.then((token){
    if(token==null){
      runApp(createApp("auth"));
    }else{
      runApp(createApp("main"));
    }
  });
}