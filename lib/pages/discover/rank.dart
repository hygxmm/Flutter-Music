import 'package:Flutter_Music/common/request.dart';
import 'package:Flutter_Music/widgets/floor_title.dart';
import 'package:flutter/material.dart';

class SongRank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('排行榜'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.playlist_play),
            onPressed: () {},
          )
        ],
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
        print('还未开始网络请求');
        return Text('还未开始网络请求');
      case ConnectionState.active:
        print('开始网络请求');
        return Text('开始网络请求');
      case ConnectionState.waiting:
        print('请求中');
        return Center(
          child: CircularProgressIndicator(),
        );
      case ConnectionState.done:
        print('请求完成');
        if (snapshot.hasError) return Text('Error: ${snapshot.error}');
        return _createListView(context, snapshot);
      default:
        return null;
    }
  }

  Widget _createListView(BuildContext context, AsyncSnapshot snapshot) {
    var data = snapshot.data;
    var list1 = data[0]['code'] == 200 ? data[0]['banners'] : [];
    var list2 = data[1]['code'] == 200 ? data[1]['result'] : [];
    var list3 = data[2]['code'] == 200 ? data[1]['result'] : [];
    var list4 = data[3]['code'] == 200 ? data[1]['result'] : [];

    return Column(
      children: <Widget>[],
    );
  }

  Future getData() async {
    List<Future> futures = [
      HttpUtil().get('/top/list', data: {'idx': 3}),
      HttpUtil().get('/top/list', data: {'idx': 0}),
      HttpUtil().get('/top/list', data: {'idx': 1}),
      HttpUtil().get('/top/list', data: {'idx': 2}),
    ];
    var result = await Future.wait(futures);
    return result;
  }
}
