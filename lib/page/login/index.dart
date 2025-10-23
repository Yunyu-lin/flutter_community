import 'dart:async';

import 'package:community_app/utils/getApi.dart';
import 'package:community_app/utils/toast.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int _count = 10;
  Timer? _timer;
  TextEditingController phoneController = TextEditingController();
  bool isSend = false;

  void beginCount() async {
    if(isSend)return;
    if (phoneController.text.isEmpty) {
      return ToastUtils.showError('请输入手机号');
    }
    if (!RegExp(r'^1[3-9]\d{9}$').hasMatch(phoneController.text)) {
      return ToastUtils.showError('请输入正确手机号');
    }
    isSend=true;
    var result = await getSendCodeAPI(phoneController.text);
    print('result3: $result');
    ToastUtils.showSuccess(result['data']['code']);
    if (_count == 10) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (_count == 0) {
          timer.cancel();
          _count = 10;
          isSend=false;
          setState(() {});
          return;
        }
        ;
        _count--;
        setState(() {});
      });
    } else {
      ToastUtils.showInfo('请稍后再试');
    }
  }

  Widget getTimeShow() {
    if (_count == 10) {
      return const Text('获取验证码');
    }
    return Text(
      '${_count}s',
      style: const TextStyle(color: Colors.grey),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('登录'),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '登录',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  '加入享+, 让生活更轻松',
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
            const SizedBox(height: 30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    controller: phoneController,
                    decoration: const InputDecoration(
                      labelText: '手机号',
                      hintText: '请输入手机号',
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shadowColor: Colors.transparent,
                    foregroundColor: const Color.fromARGB(255, 85, 145, 175),
                    minimumSize: const Size(100, 50),
                  ),
                  onPressed: () {
                    //
                    beginCount();
                  },
                  child: getTimeShow(),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                labelText: '验证码',
                hintText: '请输入6位验证码',
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  '未注册手机号经验证后将自动登录',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 85, 145, 175),
                      minimumSize: const Size(100, 50),
                    ),
                    onPressed: () {},
                    child: const Text(
                      '登录',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
