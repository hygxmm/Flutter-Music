import 'package:Flutter_Music/pages/discover.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<BottomNavigationBarItem> tabs = [
    BottomNavigationBarItem(
      icon: Icon(Icons.music_note),
      title: Text('发现'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.video_label),
      title: Text('视频'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.music_video),
      title: Text('我的'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      title: Text('我的'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.people),
      title: Text('账号'),
    ),
  ];
  final List<Widget> views = [
    DiscoverPage(),
    DiscoverPage(),
    DiscoverPage(),
    DiscoverPage(),
    DiscoverPage(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245, 0.9),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.grey,
        items: tabs,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: IndexedStack(
        index: currentIndex,
        children: views,
      ),
    );
  }
}
