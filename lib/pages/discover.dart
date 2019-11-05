import 'package:Flutter_Music/common/request.dart';
import 'package:Flutter_Music/widgets/swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:io';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          child: Container(
            height: ScreenUtil().setWidth(60),
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.2),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(ScreenUtil().setWidth(60)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.search,
                  color: Color.fromRGBO(255, 255, 255, .5),
                  size: 18,
                ),
                Text(
                  '任然',
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, .5), fontSize: 16),
                ),
              ],
            ),
          ),
          onTap: () {},
        ),
        leading: IconButton(
          icon: Icon(Icons.keyboard_voice),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.playlist_play),
            onPressed: () {
              Navigator.pushNamed(context, '/play');
            },
          )
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            HomeBanner(),
          ],
        ),
      ),
    );
  }
}

// 带网络请求的轮播图
class HomeBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Text('还未开始网络请求');
          case ConnectionState.active:
            return Text('开始网络请求');
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.done:
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            var data = snapshot.data;
            var _banners = data['banners'];
            return BannerWidget(banners: _banners);
          default:
            return null;
        }
      },
    );
  }

  Future getData() async {
    var result = await HttpUtil().get(
      '/banner',
      data: {'type': Platform.isIOS ? 2 : 1},
    );
    return result;
  }
}

// 分类列表
class HomeCategory extends StatelessWidget {
  final List<Map<String, dynamic>> lists = [
    {
      'text': '每日推荐',
      'icon': Icons.calendar_today,
    },
    {
      'text': '歌单',
      'icon': Icons.local_florist,
    },
    {
      'text': '排行榜',
      'icon': Icons.filter_list,
    },
    {
      'text': '电台',
      'icon': Icons.radio,
    },
    {
      'text': '直播',
      'icon': Icons.live_tv,
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
