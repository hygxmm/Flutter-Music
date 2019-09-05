import 'package:Flutter_Music/common/request.dart';
import 'package:Flutter_Music/widgets/floor_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    var _list = data['code'] == 200 ? data['list'] : [];
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            FloorTitle(title: '官方榜'),
            Container(
              child: ListView(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: _list.map<Widget>((item) {
                  return _rankItem(context, item);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _rankItem(context, data) {
    final String _img = data['coverImgUrl'];
    final List _list = data['tracks'];
    final String _time = data['updateFrequency'];
    final String _type = data['ToplistType'];
    int index = 0;
    return InkWell(
      onTap: () {
        int _num;
        switch (_type) {
          case 'S':
            _num = 3;
            break;
          case 'N':
            _num = 0;
            break;
          case 'O':
            _num = 2;
            break;
          case 'H':
            _num = 1;
            break;
          default:
            break;
        }
        Navigator.pushNamed(context, '/rankList', arguments: {'idx': _num});
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(30)),
        margin: EdgeInsets.only(bottom: ScreenUtil().setWidth(20)),
        child: Row(
          children: <Widget>[
            Container(
              width: ScreenUtil().setWidth(200),
              height: ScreenUtil().setWidth(200),
              margin: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage('$_img'),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.all(ScreenUtil().setWidth(15)),
                child: Text(
                  '$_time',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: ScreenUtil().setWidth(200),
                padding: EdgeInsets.symmetric(
                  vertical: ScreenUtil().setWidth(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _list.map<Widget>((item) {
                    index++;
                    return _rankItemOnce(
                      index,
                      item['first'],
                      item['second'],
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _rankItemOnce(int index, String name, String singer) {
    return Container(
      child: Text(
        '$index. $name - $singer',
        style: TextStyle(fontSize: 12),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Future getData() async {
    var result = await HttpUtil().get('/toplist/detail');
    return result;
  }
}
