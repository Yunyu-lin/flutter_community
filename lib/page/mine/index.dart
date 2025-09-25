import 'package:community_app/page/mine/components/UserAvatar.dart';
import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  MinePage({super.key});

  @override
  State<MinePage> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  final List setList = [
    {
      'icon': 'assets/images/house_profile_icon@2x.png',
      'title': '我的房屋',
    },
    {
      'icon': 'assets/images/repair_profile_icon@2x.png',
      'title': '我的报修',
    },
    {
      'icon': 'assets/images/house_profile_icon@2x.png',
      'title': '访客记录',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(40, 85, 145, 175),
      appBar: AppBar(
        title: Text(
          '我的',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            //头像资料
            UserAvatar(),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6), color: Colors.white),
              child: Column(
                children: setList.map((item) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              item['icon'],
                              width: 30,
                              height: 30,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(item['title']),
                          ],
                        ),
                        Icon(Icons.keyboard_arrow_right)
                      ],
                    ),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
