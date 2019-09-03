import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendGoods extends StatelessWidget {
  final List recomList;
  RecommendGoods({Key key, this.recomList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: ScreenUtil().setHeight(100),
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.all(5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Colors.black12,
                ),
              ),
            ),
            child: Text('火爆专区'),
          ),
          Wrap(
            spacing: 2,
            children: recomList.map((item) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    'goodsDetail',
                    arguments: item['goods_id'],
                  );
                },
                child: Container(
                  width: ScreenUtil().setWidth(365),
                  color: Colors.white,
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.only(bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: ScreenUtil().setWidth(365),
                        height: ScreenUtil().setHeight(365),
                        child: Image.network(
                          '${item['picture']}',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        '${item['goods_name']}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: ScreenUtil().setSp(26),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Text('￥${item['price']}     '),
                          Text(
                            '￥${item['show_price']}',
                            style: TextStyle(
                              color: Colors.black26,
                              decoration: TextDecoration.lineThrough,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
