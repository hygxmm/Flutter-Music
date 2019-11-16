import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class BannerSwiperWidget extends StatelessWidget {
  final List banners;
  BannerSwiperWidget({
    Key key,
    this.banners,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setWidth(305),
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(30),
        vertical: ScreenUtil().setWidth(20),
      ),
      child: PhysicalModel(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(ScreenUtil().setSp(12)),
        clipBehavior: Clip.antiAlias,
        child: Swiper(
          autoplay: true,
          duration: 1000,
          itemCount: banners.length,
          itemBuilder: (BuildContext context, int index) {
            return Image.network(
              banners[index]['pic'],
              fit: BoxFit.cover,
            );
          },
          pagination: SwiperPagination(),
        ),
      ),
    );
  }
}
