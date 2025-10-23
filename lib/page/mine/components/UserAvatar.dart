import 'package:community_app/utils/tokenManager.dart';
import 'package:flutter/material.dart';

class UserAvatar extends StatefulWidget {
  const UserAvatar({super.key});

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
                Image.asset(
                  'assets/images/avatar_1.jpg',
                  width: 40,
                  height: 40,
                ),
                Text('用户名'),
              ],
            ),
            Row(
              children: [Text('去完善资料'), Icon(Icons.keyboard_arrow_right)],
            )
          ],
        ),
      ),
      onTap: () async{
        if (await tokenManager.instance.getToken() == '') {
          Navigator.pushNamed(context, '/profile');

        }
      },
    );
  }
}
