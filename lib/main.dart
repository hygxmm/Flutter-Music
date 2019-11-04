import 'package:Flutter_Music/router/application.dart';
import 'package:Flutter_Music/router/routes.dart';
import 'package:Flutter_Music/provider/appConfig.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AppConfig()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
    return MaterialApp(
      title: '网易云音乐',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      onGenerateRoute: Application.router.generator,
    );
  }
}
