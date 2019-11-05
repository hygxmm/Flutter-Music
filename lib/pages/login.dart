import 'package:Flutter_Music/common/request.dart';
import 'package:Flutter_Music/router/application.dart';
import 'package:Flutter_Music/widgets/action_button.dart';
import 'package:Flutter_Music/widgets/empty_widget.dart';
import 'package:Flutter_Music/widgets/mobile_input.dart';
import 'package:Flutter_Music/widgets/password_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  TextEditingController mobileController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  AnimationController controller;
  Animation<Offset> animationSlide;
  Animation<double> animationOpacity;

  AnimationController loginController;
  Animation<double> loginAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    );
    animationSlide = Tween<Offset>(
      begin: Offset(0.0, 1.0),
      end: Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 1.0, curve: Curves.bounceOut),
      ),
    );
    animationOpacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 1.0, curve: Curves.linearToEaseOut),
      ),
    );

    Future.delayed(Duration(milliseconds: 500), () {
      controller.forward();
    });

    loginController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    loginAnimation = Tween<double>(
      begin: 600.0,
      end: 100.0,
    ).animate(
      CurvedAnimation(
        parent: loginController,
        curve: Interval(0.0, 1.0, curve: Curves.easeInOutQuad),
      ),
    );
    loginController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    loginController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Hero(
                  tag: 'logo',
                  child: Image.asset(
                    'images/logo.jpeg',
                    width: ScreenUtil().setWidth(100),
                    height: ScreenUtil().setWidth(100),
                  ),
                ),
              ),
            ),
            Container(
              child: FadeTransition(
                opacity: animationOpacity,
                child: SlideTransition(
                  position: animationSlide,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      MobileInput(controller: mobileController),
                      EmptyWidget(height: 50),
                      PasswordInput(controller: pwdController),
                      EmptyWidget(height: 100),
                      ActionButton(
                        title: '登   录',
                        pressed: _login,
                        animation: loginAnimation,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(),
            )
          ],
        ),
      ),
    );
  }

  void _login() {
    var _mobile = mobileController.text;
    // if (_mobile == "") {
    //   showToast('请填写手机号');
    //   return;
    // }
    var _password = pwdController.text;
    // if (_password == "") {
    //   showToast('请填写密码');
    //   return;
    // }
    loginController.forward();
    Future.delayed(Duration(milliseconds: 2000), () {
      Application.router.navigateTo(context, '/main');
    });

    // HttpUtil().post(
    //   '/login/cellphone',
    //   data: {'phone': _mobile, 'password': _password},
    // ).then((res){

    // });
  }
}
