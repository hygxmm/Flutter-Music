import 'package:Flutter_Music/provider/appConfig.dart';
import 'package:Flutter_Music/router/application.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 1.0, curve: Curves.easeOutQuart),
      ),
    );
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(Duration(milliseconds: 500), () {
          navToPage();
        });
      }
    });
    Future.delayed(Duration(milliseconds: 500), () {
      controller.forward();
    });
  }

  void navToPage() async {
    AppConfig appConfig = Provider.of<AppConfig>(context);
    if (appConfig.isLogin) {
      Application.router.navigateTo(context, '/main');
    } else {
      Application.router.navigateTo(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Container();
  }
}
