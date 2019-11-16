import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridList extends StatelessWidget {
  const GridList({
    Key key,
    this.title = '',
    this.list,
  }) : super(key: key);
  final String title;
  final List list;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(30),
        vertical: ScreenUtil().setWidth(20),
      ),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            height: ScreenUtil().setWidth(60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '$title',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(28),
                    color: Color.fromRGBO(51, 51, 51, 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Text(
                        '更多 ',
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(24),
                          color: Color.fromRGBO(51, 51, 51, 1),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: ScreenUtil().setSp(20),
                        color: Color.fromRGBO(51, 51, 51, 24),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Wrap(
              spacing: ScreenUtil().setWidth(20),
              runSpacing: ScreenUtil().setWidth(20),
              children: list.map<Widget>((item) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    width: ScreenUtil().setWidth(215),
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: ScreenUtil().setWidth(215),
                          height: ScreenUtil().setWidth(215),
                          child: PhysicalModel(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(
                              ScreenUtil().setWidth(8),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: Image.network(
                              '${item['picUrl']}',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: ScreenUtil().setWidth(10),
                          ),
                          alignment: Alignment.topLeft,
                          child: Text(
                            '${item['name']}',
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(24),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
