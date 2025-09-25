import 'package:flutter/material.dart';

class HomeNav extends StatelessWidget {
  HomeNav({super.key});

  List navList = [
    {
      'title': '我的房屋',
      'icon': 'assets/images/house_nav_icon@2x.png',
    },
    {
      'title': '我的报修',
      'icon': 'assets/images/repair_nav_icon@2x.png',
    },
    {
      'title': '访客登记',
      'icon': 'assets/images/visitor_nav_icon@2x.png',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: navList.map((e) {
          return Container(
            color: Colors.white,
            child: Column(
              children: [
                Image.asset(
                  e['icon'],
                  width: 24.0,
                  height: 24.0,
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  e['title'],
                  style: const TextStyle(fontSize: 12.0),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
