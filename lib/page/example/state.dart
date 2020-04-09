import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';


class ExampleState implements Cloneable<ExampleState> {

  String select;

  TabController tabController;

  @override
  ExampleState clone() {
    return ExampleState()
      ..tabController=tabController
      ..select=select;
  }
}

ExampleState initState(ExampleState initState) {
  return initState ?? ExampleState();
}
