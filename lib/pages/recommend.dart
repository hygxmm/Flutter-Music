import 'dart:ui';
import 'package:Flutter_Music/common/request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendPage extends StatefulWidget {
  @override
  _RecommendPageState createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> {
  List lists = [];
  @override
  void initState() {
    super.initState();
    getData();
  }

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
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.playlist_play),
                onPressed: () {
                  // Navigator.pushNamed(context, '/play');
                },
              )
            ],
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
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(30),
                        ),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.play_circle_outline,
                              size: ScreenUtil().setSp(50),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                left: ScreenUtil().setWidth(20),
                              ),
                              child: Text(
                                '播放全部',
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(32),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
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
                    'images/avatar.png',
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
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  child: Container(
                    width: ScreenUtil().setWidth(750),
                    height: ScreenUtil().setWidth(120),
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(30),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                            ScreenUtil().setWidth(6),
                          ),
                          child: Image.network(
                            '${lists[index]['album']['picUrl']}',
                            width: ScreenUtil().setWidth(100),
                            height: ScreenUtil().setWidth(100),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                              left: ScreenUtil().setWidth(20),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  '${lists[index]['name']}',
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(28),
                                    color: Colors.black87,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  '${lists[index]['artists'][0]['name']} - ${lists[index]['album']['name']}',
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(24),
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: IconButton(
                            icon: Icon(Icons.more_vert),
                            onPressed: () {},
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: lists.length,
            ),
          ),
        ],
      ),
    );
  }

  void getData() async {
    var result = await HttpUtil().get('/recommend/songs');
    print('每日推荐请求数据');
    if (result['code'] == 200) {
      var datas = result['recommend'];
      setState(() {
        lists = datas;
      });
    }
  }
}
