import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendPage extends StatefulWidget {
  @override
  _RecommendPageState createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text(
              '每日推荐',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            expandedHeight: ScreenUtil().setWidth(500),
            pinned: true,
            elevation: 0,
            brightness: Brightness.dark,
            iconTheme: IconThemeData(color: Colors.white),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(ScreenUtil().setWidth(100)),
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(
                    ScreenUtil().setWidth(30),
                  ),
                ),
                child: Container(
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {},
                    child: SizedBox.fromSize(
                      size: Size.fromHeight(ScreenUtil().setWidth(100)),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.play_circle_outline,
                            size: ScreenUtil().setWidth(50),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: ScreenUtil().setWidth(10),
                            ),
                            child: Text('播放全部'),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: <Widget>[
                  Image.asset(
                    '/images/avatar.png',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 5,
                      sigmaY: 5,
                    ),
                    child: Container(
                      color: Colors.black45,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
