import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({
    Key key,
    this.controller,
  }) : super(key: key);
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(600),
      child: TextField(
        controller: controller,
        maxLength: 12,
        obscureText: true,
        cursorRadius: Radius.elliptical(2, 8),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          filled: true,
          fillColor: Colors.white24,
          hintText: '请输入密码',
          counterText: '',
          prefixIcon: Icon(Icons.lock),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          suffixIcon: IconButton(
            icon: Icon(Icons.remove_red_eye),
            onPressed: () {
              print("切换小眼睛");
            },
          ),
        ),
      ),
    );
  }
}
