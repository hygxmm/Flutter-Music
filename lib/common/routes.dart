import 'package:Flutter_Music/pages/discover/rank.dart';
import 'package:Flutter_Music/pages/discover/rank_list.dart';
import 'package:Flutter_Music/pages/play/index.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  //排行榜
  '/rank': (BuildContext context) => SongRank(),
  '/rankList': (BuildContext context) => RankListPage(),
  '/play': (BuildContext context) => PlayPage(),
};
