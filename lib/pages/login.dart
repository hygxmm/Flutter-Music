import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.linearToEaseOut,
    );
    Future.delayed(Duration(milliseconds: 500), () {
      controller.forward();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
              left: ScreenUtil().setWidth(32),
              right: ScreenUtil().setWidth(32)),
          color: Colors.teal,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Image.asset(
                  'images/logo.jpeg',
                  width: ScreenUtil().setWidth(100),
                  height: ScreenUtil().setWidth(100),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
