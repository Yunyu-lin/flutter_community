import 'package:community_app/page/home/index.dart';
import 'package:community_app/page/mine/index.dart';
import 'package:flutter/material.dart';
import 'package:community_app/utils/tokenManager.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({super.key});

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  int _currentIndex = 0;
  List tabBarList = [
    {
      'title': '首页',
      'default': 'assets/tabs/home_default.png',
      'active': 'assets/tabs/home_active.png'
    },
    {
      'title': '我的',
      'default': 'assets/tabs/my_default.png',
      'active': 'assets/tabs/my_active.png'
    }
  ];
@override
void initState(){
  super.initState();
  tokenManager.instance.init();
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: IndexedStack(
          index: _currentIndex,
          children: [HomePage(), MinePage()],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: barItemList(),
        selectedFontSize: 12,
        selectedItemColor: Color.fromARGB(255,85,145, 175),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  List<BottomNavigationBarItem> barItemList() {
    List<BottomNavigationBarItem> tempList = [];

    for (var item in tabBarList) {
      tempList.add(BottomNavigationBarItem(
          icon: Image.asset(
            item['default'],
            width: 20,
          ),
          activeIcon: Image.asset(
            item['active'],
            width: 20,
          ),
          label: item['title']));
    }

    return tempList;
  }
}
