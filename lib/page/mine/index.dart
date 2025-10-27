import 'package:community_app/page/mine/components/UserAvatar.dart';
import 'package:community_app/utils/getApi.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class MinePage extends StatefulWidget {
  MinePage({super.key, required this.activeIndex});

  final int activeIndex;

  @override
  State<MinePage> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  Map<String, dynamic> _userInfo = {"id": "", "avatar": "", "nickName": ""};
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
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant MinePage oldWidget) {
    if (widget.activeIndex == 1) {
      userinfo();
    }
    ;
    super.didUpdateWidget(oldWidget);
  }

  void userinfo() async {
    final result = await getUserInfoAPI();
    print('result5:$result');
    _userInfo=result['data'];
    setState(() {

    });
  }

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
            UserAvatar(userInfo:_userInfo),
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
