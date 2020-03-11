import 'package:flutter/material.dart';

class AvatarContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // print('rebuildeando avatar');
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/logo.png'),
          fit: BoxFit.fitHeight
        )
      ),
      padding: EdgeInsets.only(top: 170),
      // child: const CircleAvatar(
      //   backgroundImage: AssetImage('assets/images/logo.png'),
      //   radius: 80.0,
      // ),
    );
  }
}
