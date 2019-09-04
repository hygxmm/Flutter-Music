import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavGrid extends StatelessWidget {
  final List classify;
  NavGrid({Key key, this.classify}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setWidth(200),
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          childAspectRatio: 0.75,
        ),
        physics: ScrollPhysics(),
        children: classify.map((item) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/rank');
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: ScreenUtil().setWidth(100),
                  height: ScreenUtil().setWidth(100),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    item['icon'],
                    color: Colors.white,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: ScreenUtil().setWidth(15)),
                  child: Text(
                    item['text'],
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
