import 'package:Flutter_Music/common/request.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlayPage extends StatefulWidget {
  @override
  _PlayPageState createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/avatar.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10,
              sigmaY: 10,
            ),
            child: Opacity(
              opacity: 0.6,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                ),
              ),
            ),
          ),
        ),
        SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '芒种 (原唱: 音阙诗听/赵方倩)',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(24),
                    ),
                  ),
                  Text(
                    '萧忆情Alex/原来是萝卜丫',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(20),
                    ),
                  )
                ],
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {},
                )
              ],
            ),
            body: Column(
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: Container(
                      width: ScreenUtil().setWidth(500),
                      height: ScreenUtil().setWidth(500),
                      decoration: BoxDecoration(
                        // color: Colors.tealAccent,
                        image: DecorationImage(
                          image: AssetImage('images/disc.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                bottomBar(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomBar() {
    return Container(
      height: ScreenUtil().setWidth(200),
      color: Colors.blue,
      child: Column(
        children: <Widget>[
          Container(
            height: ScreenUtil().setWidth(50),
            padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(30),
            ),
            child: Row(
              children: <Widget>[
                Text('00:36'),
                Expanded(
                  child: Slider(
                    value: 36,
                    max: 221,
                    min: 0,
                    activeColor: Colors.grey.shade700,
                    inactiveColor: Colors.grey.shade300,
                    onChanged: (double val) {
                      print(val);
                    },
                  ),
                ),
                Text('03:41'),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(30),
              ),
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  childAspectRatio: 0.9,
                ),
                physics: ScrollPhysics(),
                children: <Widget>[
                  InkWell(
                    child: Icon(Icons.loop),
                  ),
                  InkWell(
                    child: Icon(Icons.arrow_left),
                  ),
                  InkWell(
                    child: Icon(Icons.play_circle_outline),
                  ),
                  InkWell(
                    child: Icon(Icons.arrow_right),
                  ),
                  InkWell(
                    child: Icon(Icons.playlist_play),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future getData({id}) async {
    List<Future> futures = [
      HttpUtil().get('/song/url', data: {'id': id}),
      HttpUtil().get('/song/detail', data: {'ids': id}),
    ];
    var result = await Future.wait(futures);
    return result;
  }
}
