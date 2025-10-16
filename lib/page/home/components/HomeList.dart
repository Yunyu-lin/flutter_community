import 'package:flutter/material.dart';

class HomeList extends StatelessWidget {
  HomeList({super.key, required this.notifyList});

  List notifyList = [];

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
              child: GestureDetector(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item['title']),
                    Text(item['content']),
                    Text(item['createdAt']),
                  ],
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/detail',
                      arguments: {'id': item['id']});
                },
              ));
        }).toList(),
      ),
    );
  }
}
