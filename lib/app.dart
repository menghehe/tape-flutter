import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:tape/page/auth_page/page.dart';
import 'package:tape/page/creation_page/page.dart';
import 'package:tape/page/home_page/page.dart';
import 'package:tape/page/main_page/page.dart';
import 'package:tape/page/message_page/page.dart';
import 'package:tape/page/message_page/rec_comment_page/page.dart';
import 'package:tape/page/mine_page/page.dart';
import 'package:tape/page/player_page/page.dart';
import 'package:tape/page/profile_page/page.dart';


Widget createApp(String firstPae) {
  final AbstractRoutes routes = PageRoutes(
    pages: <String, Page<Object, dynamic>>{
      'auth': AuthPage(),
      'main':TabPage(),
      'home':HomePage(),
      'message':MessagePage(),
      'creation':CreationPage(),
      'mine':MinePage(),
      'player':PlayerPage(),
      'profile':ProfilePage(),

      'recComment':RecCommentPage(),
    },
    visitor: (String path, Page<Object, dynamic> page) {
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
    home: routes.buildPage(firstPae, {
      'pageList':[
        routes.buildPage("home", null),
        routes.buildPage("recComment", null),
        routes.buildPage("creation", null),
        routes.buildPage("mine", null)
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
