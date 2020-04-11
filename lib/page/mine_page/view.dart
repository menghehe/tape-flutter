import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:line_icons/line_icons.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tape/api/request/Address.dart';
import 'package:tape/models/user.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(MineState state, Dispatch dispatch, ViewService viewService) {
  SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.top, SystemUiOverlay.bottom]);

  User nullUser = new User();
  nullUser.username = 'username';
  nullUser.signature = 'signature';
  nullUser.avatar = 'default.jpg';
  nullUser.clipCount = 0;
  nullUser.followerCount = 0;
  nullUser.followingCount = 0;

  User user = state.user ?? nullUser;

  return NestedScrollView(
      controller: state.scrollController,
      headerSliverBuilder: (c, s) => [
            SliverAppBar(
              backgroundColor: Colors.white,
              expandedHeight: 250.0,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  background: Column(
                    children: <Widget>[
                      SizedBox(height: 40),
                      Stack(
                        children: <Widget>[
                          Align(
                              alignment: Alignment.topRight,
                              child: InkWell(
                                child: Icon(LineIcons.sign_out),
                                onTap: () =>
                                    {dispatch(MineActionCreator.onLogout())},
                              )),
                          Center(
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  Address.BASE_AVATAR_URL + user.avatar),
                              radius: 50,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        user.username,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        user.signature ?? '',
                        style: TextStyle(),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text(
                                  user.clipCount.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "视频",
                                  style: TextStyle(),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                dispatch(MineActionCreator.onTapFollowing());
                              },
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    user.followingCount.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    "关注",
                                    style: TextStyle(),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                dispatch(MineActionCreator.onTapFollower());
                              },
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    user.followerCount.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    "粉丝",
                                    style: TextStyle(),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          ],
      body: Container(
        child: SmartRefresher(
            controller: state.refreshController,
            enablePullDown: true,
            header: WaterDropHeader(),
            enablePullUp: true,
            onRefresh: () {
              dispatch(MineActionCreator.onRefresh());
            },
            onLoading: () {
              dispatch(MineActionCreator.onRefresh());
            },
            child: _buildClipList(state, dispatch)),
      ));
}

Widget _buildClipList(MineState state, dispatch) {
  if (state.clipList.length == 0) {
    return Container();
  }
  return new StaggeredGridView.countBuilder(
    shrinkWrap: true,
    crossAxisCount: 4,
    itemCount: state.clipList.length,
    itemBuilder: (BuildContext context, int index) {
      return Padding(
          padding: EdgeInsets.all(5.0),
          child: InkWell(
            child: Image.network(
              Address.BASE_COVER_URL + state.clipList[index].coverPath,
              fit: BoxFit.cover,
            ),
            onTap: () {
              dispatch(MineActionCreator.onTapClipCover(state.clipList[index]));
            },
          ));
    },
    staggeredTileBuilder: (int index) =>
        new StaggeredTile.count(2, index.isEven ? 2 : 1),
    mainAxisSpacing: 4.0,
    crossAxisSpacing: 4.0,
  );
}
