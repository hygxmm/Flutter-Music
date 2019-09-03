import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: ClipOval(
                  child: FadeInImage.assetNetwork(
                    placeholder: 'images/avatar.png',
                    fit: BoxFit.cover,
                    image: 'images/avatar.png',
                    width: ScreenUtil().setWidth(200),
                    height: ScreenUtil().setWidth(200),
                  ),
                ),
              ),
            ),
            Container(
              height: ScreenUtil().setWidth(500),
              width: ScreenUtil().setWidth(750),
              child: Column(
                children: <Widget>[],
              ),
            )
          ],
        ),
      ),
    );
  }
}
