import 'package:fish_redux/fish_redux.dart';
import 'package:tape/page/example/component/a_component/component.dart';
import 'package:tape/page/example/component/a_component/state.dart';
import 'package:tape/page/example/component/b_component/component.dart';
import 'package:tape/page/example/component/b_component/state.dart';

import '../state.dart';

class ExampleAdapter extends DynamicFlowAdapter<ExampleState> {
  ExampleAdapter()
      : super(
          pool: <String, Component<Object>>{
            "AComponent":AComponent(),
            "BComponent":BComponent(),
          },
          connector: _ExampleConnector(),
          );
}

class _ExampleConnector extends ConnOp<ExampleState, List<ItemBean>> {
  @override
  List<ItemBean> get(ExampleState state) {
    if(state.select=="A"){
      return List<ItemBean>.generate(50, (index)=>ItemBean("AComponent", AState()..index=index));
    }else{
      return List<ItemBean>.generate(50, (index)=>ItemBean("BComponent", BState()..index=index));
    }
  }

  @override
  void set(ExampleState state, List<ItemBean> items) {

  }

}
