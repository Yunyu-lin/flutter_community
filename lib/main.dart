
import 'package:community_app/page/notice/index.dart';
import 'package:community_app/page/tab_Bar/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark, // 黑色字体
          ),
        ),
      ),
      routes: {
        '/':(context)=> const TabBarPage(),
        '/detail':(context)=>const NoticeDetail(),
      },
      initialRoute: '/',
    );
  }
}
