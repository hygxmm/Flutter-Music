import 'package:Flutter_Music/common/request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RankPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('排行榜'),
        centerTitle: true,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              if (snapshot.hasError) return Text('Error: ${snapshot.error}');
              var data = snapshot.data;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(
                        top: ScreenUtil().setWidth(40),
                        left: ScreenUtil().setWidth(40),
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        if (index == 0) {
                          return Text(
                            '官方榜',
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(32),
                              color: Colors.black87,
                            ),
                          );
                        } else {
                          
                        }
                      },
                    ),
                  ],
                ),
              );
            default:
              return null;
          }
        },
      ),
    );
  }

  Future getData() async {
    var result = await HttpUtil().get('/');
    print('请求排行榜数据');
    return result;
  }
}
