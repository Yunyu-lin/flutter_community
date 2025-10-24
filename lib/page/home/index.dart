import 'package:community_app/page/home/components/HomeList.dart';
import 'package:community_app/page/home/components/HomeNav.dart';
import 'package:community_app/utils/api_exception.dart';
import 'package:community_app/utils/getApi.dart';
import 'package:community_app/utils/toast.dart';
import 'package:community_app/utils/tokenManager.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List notifyList = [];

  @override
  void initState() {
    super.initState();
    _getNotifyList();
  }


  _getNotifyList() async {
    try {
      var result = await getAnnouncementAPI();
      print('result: $result');
      if (result['code'] != ResultCode.SUCCESS_CODE) return ToastUtils.showError('请求失败');
      ToastUtils.showSuccess('请求成功');
      setState(() {
        notifyList = result['data'];
      });
    } catch (e) {
      ToastUtils.showInfo('请求超时');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(40, 85, 145, 175),
      appBar: AppBar(
        title: const Text(
          'Community App',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        children: [
          ElevatedButton(onPressed: (){
            tokenManager.instance.removeToken();
          }, child: Text('退出登录')),

          // 导航条
          HomeNav(),

          const SizedBox(
            height: 6.0,
          ),
          // 中间广告图
          ClipRRect(
            borderRadius: BorderRadius.circular(6.0),
            child: Image.asset('assets/images/banner@2x.jpg'),
          ),
          const SizedBox(
            height: 6.0,
          ),
          // 社区公告
          HomeList(notifyList:notifyList)
        ],
      ),
    );
  }
}
