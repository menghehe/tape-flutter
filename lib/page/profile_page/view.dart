import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tape/api/request/Address.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(ProfileState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    body: SmartRefresher(
      controller: state.refreshController,
      header: MaterialClassicHeader(
        backgroundColor: Colors.blueAccent,
        distance: 80.0,
      ),
      onRefresh: (){dispatch(ProfileActionCreator.onRefresh());},
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 40),
              CircleAvatar(
                backgroundImage: NetworkImage(
                    Address.BASE_AVATAR_URL+ state.user.avatar
                ),
                radius: 50,
              ),
              SizedBox(height: 10),
              Text(
                state.user.username,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              SizedBox(height: 3),

              Text(
                state.user.signature??'',
                style: TextStyle(
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          '20',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Posts",
                          style: TextStyle(
                          ),
                        ),
                      ],
                    ),

                    Column(
                      children: <Widget>[
                        Text(
                          '100',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Friends",
                          style: TextStyle(
                          ),
                        ),
                      ],
                    ),

                    Column(
                      children: <Widget>[
                        Text(
                          '30',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Groups",
                          style: TextStyle(
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
              SizedBox(height: 20),
              _buildClipList(state,dispatch)
            ],
          ),
        ),
      ),
    ),
  );
}

Widget _buildClipList(ProfileState state, dispatch){
  if(state.clipList.length==0){
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
            Address.BASE_COVER_URL+ state.clipList[index].thumbnail,
            fit: BoxFit.cover,
          ),
          onTap: (){dispatch(ProfileActionCreator.onTapClipCover(state.clipList[index]));},
        )
      );
    },
    staggeredTileBuilder: (int index) =>
    new StaggeredTile.count(2, index.isEven ? 2 : 1),
    mainAxisSpacing: 4.0,
    crossAxisSpacing: 4.0,
  );

}
