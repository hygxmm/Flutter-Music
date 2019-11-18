import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './route_handlers.dart';

class Routes {
  static String root = '/';
  static String login = '/login';
  static String main = '/main';
  static String recommend = '/recommend';
  static String rank = '/rank';

  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        return Scaffold(
          body: Center(
            child: Text('404'),
          ),
        );
      },
    );

    router.define(root, handler: splashHandler);
    router.define(login, handler: loginHandler);
    router.define(main, handler: mainHandler);
    router.define(
      recommend,
      handler: recommendHandler,
      transitionType: TransitionType.cupertino,
    );
    router.define(rank, handler: rankHandler);
  }
}
