import 'package:flutter/material.dart';
import 'package:tuk_ride/core/constant/MyColors.dart';

class TopBar extends StatefulWidget {
  const TopBar({super.key});

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      left: 10,
      right: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/userAvater.png'),
          ),
          Container(
            width: 190,
            height: 40,
            decoration: BoxDecoration(
                color: MyColor.myWhite,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Online',
                    style: TextStyle(color: MyColor.myBlack),
                  ),
                  Switch(
                      value: true,
                      onChanged: (bool newValue) {},
                      activeColor: MyColor.myYellow),
                ],
              ),
            ),
          ),
          IconButton(
            icon: Image.asset(
              'assets/images/notificationMap.png',
              width: 60,
              height: 60,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
