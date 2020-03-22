import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart';
import 'package:tape/page/home_page/clip_cover_component/component.dart';
import 'package:tape/page/home_page/clip_cover_component/state.dart';
import 'package:tape/page/home_page/state.dart';

import 'reducer.dart';
import 'state.dart';

class ClipCoverListAdapter extends DynamicFlowAdapter<HomeState> {
  ClipCoverListAdapter()
      : super(
    pool: <String, Component<Object>>{
      'clipCover': ClipCoverComponent(),
    },
    connector: _ClipCoverListConnector(),
        );
}

ListAdapter buildAdapter(
    ClipCoverListState state, Dispatch dispatch, ViewService service) {
  final List<IndexedWidgetBuilder> builders =
      Collections.compact(<IndexedWidgetBuilder>[]);
  return ListAdapter(
    (BuildContext buildContext, int index) =>
        builders[index](buildContext, index),
    builders.length,
  );
}

class _ClipCoverListConnector extends ConnOp<HomeState, List<ItemBean>> {
  @override
  List<ItemBean> get(HomeState state) {
    if (state.clipCoverStateList?.isNotEmpty == true) {
      return state.clipCoverStateList
          .map<ItemBean>((ClipCoverState data) => ItemBean('clipCover', data))
          .toList(growable: true);
    } else {
      return <ItemBean>[];
    }
  }

  @override
  void set(HomeState state, List<ItemBean> todoList) {
    if (todoList?.isNotEmpty == true) {
      state.clipCoverStateList = List<ClipCoverState>.from(
          todoList.map<ClipCoverState>((ItemBean bean) => bean.data).toList());
    } else {
      state.clipCoverStateList = <ClipCoverState>[];
    }
  }
}