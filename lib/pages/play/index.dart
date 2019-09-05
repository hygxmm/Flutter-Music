import 'dart:ui';

import 'package:Flutter_Music/common/request.dart';
import 'package:flutter/material.dart';

class PlayPage extends StatefulWidget {
  @override
  _PlayPageState createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;
    return FutureBuilder(
      future: getData(args['id']),
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
            if (snapshot.hasError) return Text('Error: ${snapshot.error}');
            return _createView(context, snapshot);
          default:
            return null;
        }
      },
    );
  }

  Widget _createView(BuildContext context, AsyncSnapshot snapshot) {
    var data = snapshot.data;
    print(data);
    var _imgUrl = data[1][''];

    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(''),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black45,
                BlendMode.overlay,
              ),
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
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text('${'data'}'),
          ),
          body: Stack(
            alignment: FractionalOffset(0.5, 0.0),
            children: <Widget>[
              Stack(
                alignment: FractionalOffset(0.7, 0.1),
                children: <Widget>[
                  Container(),
                  Container(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future getData(id) async {
    List<Future> futures = [
      HttpUtil().get('/song/url', data: {'id': id}),
      HttpUtil().get('/song/detail', data: {'ids': id}),
    ];
    var result = await Future.wait(futures);
    return result;
  }
}
