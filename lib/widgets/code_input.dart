import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CodeInput extends StatefulWidget {
  const CodeInput({
    Key key,
    this.controller,
    this.getCode,
  }) : super(key: key);
  final TextEditingController controller;
  final Function getCode;

  @override
  _CodeInputState createState() => _CodeInputState();
}

class _CodeInputState extends State<CodeInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(600),
      child: TextField(
        controller: widget.controller,
        maxLength: 4,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white24,
          hintText: '验证码',
          counterText: '',
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          prefixIcon: Icon(Icons.lock_outline),
          suffixIcon: FlatButton(
            child: Text(
              '获取验证码',
              style: TextStyle(
                color: Colors.green,
              ),
            ),
            onPressed: () {
              print("获取验证码");
              widget.getCode();
            },
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
