import 'package:Flutter_Music/pages/discover.dart';
import 'package:flutter/material.dart';

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
      icon: Icon(Icons.queue_music),
      title: Text('我的'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.people_outline),
      title: Text('云村'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_outline),
      title: Text('账号'),
    ),
  ];
  final List<Widget> views = [
    DiscoverPage(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromRGBO(245, 245, 245, 0.9),
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
