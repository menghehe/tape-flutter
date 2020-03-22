import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:tape/page/home_page/clip_cover_list_adapter/adapter.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class HomePage extends Page<HomeState, Map<String, dynamic>> {
  HomePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<HomeState>(
                adapter: NoneConn<HomeState>()+ClipCoverListAdapter(),
                slots: <String, Dependent<HomeState>>{
                }),
            middleware: <Middleware<HomeState>>[
            ],);

}
