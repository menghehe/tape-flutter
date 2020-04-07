import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class AuthPage extends Page<AuthState, Map<String, dynamic>> {
  AuthPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<AuthState>(
                adapter: null,
                slots: <String, Dependent<AuthState>>{
                }),
            middleware: <Middleware<AuthState>>[
            ],);

}
