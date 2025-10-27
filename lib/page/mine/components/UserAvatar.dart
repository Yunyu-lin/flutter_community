import 'package:community_app/utils/tokenManager.dart';
import 'package:flutter/material.dart';

class UserAvatar extends StatefulWidget {
  const UserAvatar({super.key, required this.userInfo});

  final userInfo;

  @override
  State<UserAvatar> createState() => _UserAvatarState();
}

class _UserAvatarState extends State<UserAvatar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                _getUserAvatar(),
                const SizedBox(
                  width: 10,
                ),
                _getUserNickName()
              ],
            ),
            Row(
              children: [Text('去完善资料'), Icon(Icons.keyboard_arrow_right)],
            )
          ],
        ),
      ),
      onTap: () async {
        Navigator.pushNamed(context, '/profile');
      },
    );
  }

  Widget _getUserAvatar() {
    if (widget.userInfo['avatar'] != null) {
      return Image.network(
        widget.userInfo['avatar'],
        width: 40,
        height: 40,
      );
    } else {
      return Image.asset(
        'assets/images/avatar_1.jpg',
        width: 40,
        height: 40,
      );
    }
  }

  Widget _getUserNickName() {
    if (widget.userInfo['nickName'] != null) {
      return Text(widget.userInfo['nickName']);
    } else {
      return const Text('默认昵称');
    }
  }
}
