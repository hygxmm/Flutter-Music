import 'package:Flutter_Music/router/application.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavigatorGrid extends StatelessWidget {
  const NavigatorGrid({
    Key key,
    this.classify = const [],
  }) : super(key: key);
  final List<Map<String, dynamic>> classify;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(30),
        vertical: ScreenUtil().setWidth(10),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Color(0xFFececec),
          ),
        ),
      ),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          childAspectRatio: 0.9,
        ),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: classify.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              if (classify[index]['path'] != null) {
                Application.router.navigateTo(context, classify[index]['path']);
              }
            },
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: ScreenUtil().setWidth(80),
                    height: ScreenUtil().setWidth(80),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).accentColor,
                    ),
                    child: Icon(
                      classify[index]['icon'],
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: ScreenUtil().setWidth(16)),
                    child: Text(
                      '${classify[index]['text']}',
                      style: TextStyle(fontSize: ScreenUtil().setSp(24)),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
