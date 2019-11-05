import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MobileInput extends StatelessWidget {
  const MobileInput({
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
        maxLength: 11,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white24,
          hintText: '请输入手机号',
          counterText: '',
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          prefixIcon: Icon(Icons.person_pin),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
