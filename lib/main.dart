import 'package:community_app/page/login/index.dart';
import 'package:community_app/page/notice/index.dart';
import 'package:community_app/page/profile/index.dart';
import 'package:community_app/page/tab_Bar/index.dart';
import 'package:community_app/utils/tokenManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  tokenManager.instance.init();
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
        '/': (context) => const TabBarPage(),
        '/detail': (context) => const NoticeDetail(),
        '/login': (context) => const LoginPage(),
        // '/profile':(context)=>const ProfilePage(),
      },
      initialRoute: '/',
      onGenerateRoute: (setting) {
        final token = tokenManager.instance.getToken();
        if (token.isEmpty)
          return MaterialPageRoute(builder: (context) => const LoginPage());
        if (setting.name == '/profile')
          return MaterialPageRoute(builder: (context) => const ProfilePage());
      },
    );
  }
}
