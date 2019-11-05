import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    Key key,
    this.height = 20,
  }) : super(key: key);
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setWidth(height),
    );
  }
}
