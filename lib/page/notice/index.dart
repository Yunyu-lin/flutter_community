import 'package:community_app/utils/getApi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class NoticeDetail extends StatefulWidget {
  const NoticeDetail({super.key});

  @override
  State<NoticeDetail> createState() => _NoticeDetailState();
}

class _NoticeDetailState extends State<NoticeDetail> {
  Map notifyDetail = {};

  @override
  void iniState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final params =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    print('params:::${params}');
    if (params != null && params['id'] != null) _getAnnounceDetail(params['id']);
  }

  _getAnnounceDetail(String id) async {
    var result = await getAnnouncementIdAPI(id);
    print('result2: $result');
    notifyDetail = result['data'];
    setState(() {});
  }

  Widget getBody() {
    return ListView(scrollDirection: Axis.vertical, children: [
      Container(
          padding: const EdgeInsets.all(10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // 标题
            Text(notifyDetail['title'] ?? '',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(notifyDetail['creatorName'] ?? '',
                  style: const TextStyle(color: Colors.grey)),
              Text(notifyDetail['createdAt'] ?? '',
                  style: const TextStyle(color: Colors.grey))
            ]),
            const SizedBox(height: 10),
            // 内容
            HtmlWidget(notifyDetail['content'] ?? '')
          ]))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: false,
          elevation: 0.0,
          foregroundColor: Colors.black,
          title: const Text('公告详情'),
        ),
        body: getBody());
  }
}
