import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class CreationPage extends Page<CreationState, Map<String, dynamic>> {
  CreationPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<CreationState>(
                adapter: null,
                slots: <String, Dependent<CreationState>>{
                }),
            middleware: <Middleware<CreationState>>[
            ],);

}
