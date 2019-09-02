import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiscoverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: ScreenUtil().setWidth(500),
          height: ScreenUtil().setWidth(60),
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 0.5),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(ScreenUtil().setWidth(60)),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.keyboard_voice),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.phonelink),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
