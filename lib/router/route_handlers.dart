import 'package:Flutter_Music/pages/login.dart';
import 'package:Flutter_Music/pages/main.dart';
import 'package:Flutter_Music/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

// 根路由
var splashHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
    return SplashPage();
  },
);

// 登录页
var loginHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
    return LoginPage();
  },
);

// 主页
var mainHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
    return MainPage();
  },
);
