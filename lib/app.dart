import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:tape/page/clip_post_page/page.dart';
import 'package:tape/page/clip_record_page/page.dart';
import 'package:tape/page/creation_page/page.dart';
import 'package:tape/page/home_page/page.dart';
import 'package:tape/page/login_page/page.dart';
import 'package:tape/page/main_page/page.dart';
import 'package:tape/page/player_page/page.dart';
import 'package:tape/page/profile_page/page.dart';
import 'package:tape/utils/storage.dart';

import 'global_store/state.dart';
import 'global_store/store.dart';

Widget createApp() {
  final AbstractRoutes routes = PageRoutes(
    pages: <String, Page<Object, dynamic>>{
      'clipRecord':ClipRecordPage(),
      'login': LoginPage(),
      'main':TabPage(),
      'home':HomePage(),
      'clipPost':ClipPostPage(),
      'player':PlayerPage(),
      'profile':ProfilePage(),
      'creation':CreationPage()
    },
    visitor: (String path, Page<Object, dynamic> page) {
      /// 只有特定的范围的 Page 才需要建立和 AppStore 的连接关系
      /// 满足 Page<T> ，T 是 GlobalBaseState 的子类
      if (page.isTypeof<GlobalBaseState>()) {
        /// 建立 AppStore 驱动 PageStore 的单向数据连接
        /// 1. 参数1 AppStore
        /// 2. 参数2 当 AppStore.state 变化时, PageStore.state 该如何变化
        page.connectExtraStore<GlobalState>(GlobalStore.store,
                (Object pagestate, GlobalState appState) {
              final GlobalBaseState p = pagestate;
              if (p.themeColor != appState.themeColor ||p.user!=appState.user||p.themeData!=appState.themeData) {
                if (pagestate is Cloneable) {
                  final Object copy = pagestate.clone();
                  final GlobalBaseState newState = copy;
                  newState.themeColor = appState.themeColor;
                  newState.themeData = appState.themeData;
                  newState.user = appState.user;
                  return newState;
                }
              }
              return pagestate;
            });
      }
      page.enhancer.append(
        /// View AOP
        viewMiddleware: <ViewMiddleware<dynamic>>[
          safetyView<dynamic>(),
        ],

        /// Adapter AOP
        adapterMiddleware: <AdapterMiddleware<dynamic>>[
          safetyAdapter<dynamic>()
        ],

        /// Effect AOP
        effectMiddleware: [
          _pageAnalyticsMiddleware<dynamic>(),
        ],

        /// Store AOP
        middleware: <Middleware<dynamic>>[
          logMiddleware<dynamic>(tag: page.runtimeType.toString()),
        ],
      );
    },
  );
  final ThemeData _lightTheme = ThemeData.light();
  final ThemeData _darkTheme = ThemeData.dark();
  return MaterialApp(
    title: 'Tape',
    theme: _lightTheme,
    darkTheme: _darkTheme,
    debugShowCheckedModeBanner: false,
    home: routes.buildPage("main", {
      'pageList':[
        routes.buildPage("home", null),
        routes.buildPage("clipRecord", null),
        routes.buildPage("creation", null),
        routes.buildPage("profile", null)
      ]
    }),  //把他作为默认页面
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute<Object>(builder: (BuildContext context) {
        return routes.buildPage(settings.name, settings.arguments);
      });
    },
  );
}


EffectMiddleware<T> _pageAnalyticsMiddleware<T>({String tag = 'redux'}) {
  return (AbstractLogic<dynamic> logic, Store<T> store) {
    return (Effect<dynamic> effect) {
      return (Action action, Context<dynamic> ctx) {
        if (logic is Page<dynamic, dynamic> && action.type is Lifecycle) {
          print('${logic.runtimeType} ${action.type.toString()} ');
        }
        return effect?.call(action, ctx);
      };
    };
  };
}
