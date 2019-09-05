import 'package:Flutter_Music/common/request.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RankListPage extends StatefulWidget {
  @override
  _RankListPageState createState() => _RankListPageState();
}

class _RankListPageState extends State<RankListPage> {
  @override
  Widget build(BuildContext context) {
    Map<String, int> args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: FutureBuilder(
        future: getData(args['idx']),
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
    var _data = data['code'] == 200 ? data['playlist'] : [];
    var _name = _data['name'];
    var _bgImage = _data['creator']['backgroundUrl'];
    var _list = _data['tracks'];
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('$_bgImage'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('$_name'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.playlist_play),
              onPressed: () {},
            )
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: ScreenUtil().setWidth(500),
                child: Container(
                  child: Row(
                    children: <Widget>[
                      InkWell(
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.confirmation_number),
                              Text('15.2万'),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Icon(CupertinoIcons.share),
                              Text('15.2万'),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Icon(CupertinoIcons.music_note),
                              Text('15.2万'),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Icon(CupertinoIcons.check_mark),
                              Text('15.2万'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(ScreenUtil().setWidth(40)),
                    topRight: Radius.circular(ScreenUtil().setWidth(40)),
                  ),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _list.length,
                  physics: PageScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Text('${++index}'),
                      title: RichText(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        text: TextSpan(
                          text: '${_list[index]['name']}',
                          style: TextStyle(color: Colors.black),
                          children: _list[index]['alia'].map<TextSpan>((item) {
                            return TextSpan(
                              text: '$item',
                              style: TextStyle(color: Colors.grey.shade500),
                            );
                          }).toList(),
                        ),
                      ),
                      subtitle: Row(
                        children: <Widget>[
                          Text(
                            '${_list[index]['ar'][0]['name']}',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                          Text(' - '),
                          Text(
                            '${_list[index]['al']['name']}',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/play',
                          arguments: {'id': _list[index]['id']},
                        );
                      },
                    );
                  },
                  itemExtent: ScreenUtil().setWidth(100),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  //获取数据
  Future getData(int type) async {
    var response = await HttpUtil().get('/top/list', data: {'idx': type});
    return response;
  }
}
