import 'package:Flutter_Music/common/request.dart';
import 'package:Flutter_Music/widgets/floor_list.dart';
import 'package:Flutter_Music/widgets/floor_title.dart';
import 'package:Flutter_Music/widgets/grid.dart';
import 'package:Flutter_Music/widgets/swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:io';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/phoenix_header.dart';
import 'package:flutter_easyrefresh/phoenix_footer.dart';

class DiscoverPage extends StatelessWidget {
  final String realkeyword = '隔壁老樊';
  final List<Map> navgrid = [
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
        elevation: 0,
      ),
      body: FutureBuilder(
        future: getData(),
        builder: _buildFuture,
      ),
    );
  }

  Future getData() async {
    List<Future> futures = [
      HttpUtil().get('/banner', data: {'type': Platform.isIOS ? 2 : 1}),
      HttpUtil().get('/personalized'),
    ];
    var result = await Future.wait(futures);
    return result;
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

    return EasyRefresh(
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          BannersWidget(banners: bannerList),
          NavGrid(classify: navgrid),
          Divider(height: 1),
          FloorTitle(title: '推荐歌单'),
          FloorList(list: recomList),
        ],
      ),
      onRefresh: getData,
      onLoad: () async {},
      header: PhoenixHeader(),
      footer: PhoenixFooter(),
    );
  }
}
