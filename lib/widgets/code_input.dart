import 'package:flutter/material.dart';
import 'package:Flutter_Music/common/request.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CodeInput extends StatelessWidget {
  final TextEditingController codeCtrl;
  final TextEditingController mobileCtrl;
  CodeInput(this.codeCtrl, this.mobileCtrl);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(600),
      child: TextField(
        controller: codeCtrl,
        maxLength: 4,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white24,
          hintText: '请输入验证码',
          counterText: '',
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          prefixIcon: Icon(Icons.drafts),
          suffixIcon: InkWell(
            child: Container(
              width: ScreenUtil().setWidth(200),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text(
                '获取验证码',
                style: TextStyle(color: Theme.of(context).accentColor),
              ),
            ),
            onTap: _getCode,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  void _getCode() async {
    print(mobileCtrl.text);
    var response = await HttpUtil()
        .post('user/sendSms', data: {'mobile': mobileCtrl.text});
    print(response.data);
  }
}
