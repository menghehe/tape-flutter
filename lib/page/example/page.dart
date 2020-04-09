import 'package:fish_redux/fish_redux.dart';

import 'adapter/adapter.dart';
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ExamplePage extends Page<ExampleState, ExampleState>  with SingleTickerProviderMixin{
  ExamplePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<ExampleState>(
                adapter: NoneConn<ExampleState>()+ExampleAdapter(),
                slots: <String, Dependent<ExampleState>>{
                }),
            middleware: <Middleware<ExampleState>>[
            ],);

}
