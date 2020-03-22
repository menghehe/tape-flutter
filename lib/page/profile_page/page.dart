import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ProfilePage extends Page<ProfileState, Map<String, dynamic>> {
  ProfilePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<ProfileState>(
                adapter: null,
                slots: <String, Dependent<ProfileState>>{
                }),
            middleware: <Middleware<ProfileState>>[
            ],);

}
