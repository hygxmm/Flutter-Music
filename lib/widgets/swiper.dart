import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class BannersWidget extends StatelessWidget {
  final List banners;
  BannersWidget({Key key, this.banners}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setWidth(300),
      child: Stack(
        children: <Widget>[
          Container(
            height: ScreenUtil().setWidth(150),
            color: Theme.of(context).accentColor,
          ),
          Positioned(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(40),
                vertical: ScreenUtil().setWidth(20),
              ),
              child: Swiper(
                autoplay: true,
                duration: 1000,
                itemCount: banners.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(
                        ScreenUtil().setWidth(20),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(banners[index]['pic']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                pagination: SwiperPagination(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
