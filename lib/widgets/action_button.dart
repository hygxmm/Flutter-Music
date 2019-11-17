import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key key,
    this.title,
    this.animation,
    @required this.pressed,
  }) : super(key: key);
  final String title;
  final Function pressed;
  final Animation animation;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(animation.value),
      height: ScreenUtil().setWidth(100),
      child: RaisedButton(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: animation.value > 100
            ? Text(
                '$title',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: ScreenUtil().setSp(36),
                ),
              )
            : CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
              ),
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        onPressed: pressed,
        elevation: 0,
      ),
    );
  }
}
