import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:tape/api/request/Address.dart';
import 'package:tape/models/user.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(FriendState state, Dispatch dispatch, ViewService viewService) {

  Widget buildFriendStatusButton(User friend){
    if(friend.friendShipStatus==0){
      return FlatButton(
        child: Text(
          "关注",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        color: Colors.green,
        onPressed: (){},
      );
    }

    if(friend.friendShipStatus==1){
      return FlatButton(
        child: Text(
          "取消关注",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        color: Colors.grey,
        onPressed: (){},
      );
    }

    if(friend.friendShipStatus==2){
      return FlatButton(
        child: Text(
          "互相关注",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        color: Colors.green,
        onPressed: (){},
      );
    }
  }

  Widget buildFriend(){
    return ListView.separated(
      padding: EdgeInsets.all(10),
      separatorBuilder: (BuildContext context, int index) {
        return Align(
          alignment: Alignment.centerRight,
          child: Container(
            height: 0.5,
            width: MediaQuery.of(context).size.width / 1.3,
            child: Divider(),
          ),
        );
      },
      itemCount: state.friendList.length,
      itemBuilder: (BuildContext context, int index) {
        User friend = state.friendList[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                Address.BASE_AVATAR_URL+friend.avatar
              ),
              radius: 25,
            ),

            contentPadding: EdgeInsets.all(0),
            title: Text(friend.username),
            subtitle: Text(friend.signature),
            trailing: buildFriendStatusButton(friend),
            onTap: (){},
          ),
        );
      },

    );
  }

  return Scaffold(
    body: buildFriend(),
  );
}
