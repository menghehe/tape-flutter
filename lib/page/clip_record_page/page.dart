import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ClipRecordPage extends Page<ClipRecordState, Map<String, dynamic>> {
  ClipRecordPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<ClipRecordState>(
                adapter: null,
                slots: <String, Dependent<ClipRecordState>>{
                }),
            middleware: <Middleware<ClipRecordState>>[
            ],);

}
