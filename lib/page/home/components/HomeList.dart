import 'package:flutter/material.dart';

class HomeList extends StatefulWidget {
  HomeList({super.key});

  @override
  State<HomeList> createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  List notifyList = [
    {
      'title': '中秋、国庆温馨提示中秋、国庆温馨提示',
      'content': '中秋、国庆温馨提示中秋、国庆温馨提示中秋、国庆温馨提示中秋、国庆温馨提示中秋、国庆温馨提示中秋、国庆温馨提示',
      'createdAt': '2024-09-22 15:00:00',
    },
    {
      'title': '中秋、国庆温馨提示中秋、国庆温馨提示',
      'content': '中秋、国庆温馨提示中秋、国庆温馨提示中秋、国庆温馨提示中秋、国庆温馨提示中秋、国庆温馨提示中秋、国庆温馨提示',
      'createdAt': '2024-09-22 15:00:00',
    },
    {
      'title': '中秋、国庆温馨提示中秋、国庆温馨提示',
      'content': '中秋、国庆温馨提示中秋、国庆温馨提示中秋、国庆温馨提示中秋、国庆温馨提示中秋、国庆温馨提示中秋、国庆温馨提示',
      'createdAt': '2024-09-22 15:00:00',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: notifyList.map((item) {
          return Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item['title']),
                Text(item['content']),
                Text(item['createdAt']),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
