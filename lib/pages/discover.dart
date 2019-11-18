import 'package:Flutter_Music/common/request.dart';
import 'package:Flutter_Music/widgets/banner_swiper.dart';
import 'package:Flutter_Music/widgets/grid_list.dart';
import 'package:Flutter_Music/widgets/navigator_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:io';

class DiscoverPage extends StatelessWidget {
  final String realkeyword = '隔壁老樊';
  final List<Map<String, dynamic>> navgrid = [
    {
      'text': '每日推荐',
      'icon': Icons.calendar_today,
      'path': '/recommend',
    },
    {
      'text': '歌单',
      'icon': Icons.local_florist,
    },
    {
      'text': '排行榜',
      'icon': Icons.filter_list,
      'path': '/rank',
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
                  '$realkeyword',
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
      body: FutureBuilder(
        future: getData(),
        builder: _buildFuture,
      ),
    );
  }

  Widget _buildFuture(BuildContext context, AsyncSnapshot snapshot) {
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
        if (snapshot.hasError) return Text('Error: ${snapshot.error}');
        return _createListView(context, snapshot);
      default:
        return null;
    }
  }

  Widget _createListView(BuildContext context, AsyncSnapshot snapshot) {
    var data = snapshot.data;
    var bannerList = data[0]['code'] == 200 ? data[0]['banners'] : [];
    var recomList = data[1]['code'] == 200 ? data[1]['result'] : [];
    var newSongs = data[2]['code'] == 200 ? data[2]['albums'] : [];

    return EasyRefresh(
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          BannerSwiperWidget(banners: bannerList),
          NavigatorGrid(classify: navgrid),
          GridList(title: '推荐歌单', list: recomList),
          GridList(title: '新碟上架', list: newSongs),
        ],
      ),
      onRefresh: getData,
      onLoad: () async {},
    );
  }

  Future getData() async {
    List<Future> futures = [
      HttpUtil().get('/banner', data: {'type': Platform.isIOS ? 2 : 1}),
      HttpUtil().get('/personalized', data: {'limit': 6}),
      HttpUtil().get('/top/album', data: {'limit': 3}),
    ];
    var result = await Future.wait(futures);
    print("发现页请求数据");
    return result;
  }
}
