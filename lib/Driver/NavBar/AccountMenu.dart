import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tuk_ride/constant/MyColors.dart';

class AccountMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.only(top: 50),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                child: const Text('My Account',
                    style: TextStyle(
                        color: Color(0xff242424),
                        fontWeight: FontWeight.bold,
                        fontSize: 30)),
              ),
              Container(
                  height: 5,
                  width: 180,
                  decoration: const BoxDecoration(
                      color: Color(0xfff9c32b),
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
              SingleChildScrollView(
                child: Column(
                  children: [
                    ListTile(
                      shape: Border(
                        bottom: BorderSide(
                          color: const Color(0xffe9e9e9),
                        ),
                      ),
                      title: Text('My Profile'),
                      trailing: IconButton(
                        icon: Image.asset(
                          'assets/images/next.png',
                          width: 24,
                          height: 24,
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed('profial');
                        },
                      ),
                      leading: Image.asset(
                        'assets/images/user (2).png',
                        height: 35,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                      onTap: () {},
                    ),
                    ListTile(
                      shape: Border(
                        bottom: BorderSide(
                          color: const Color(0xffe9e9e9),
                        ),
                      ),
                      title: Text('Payment'),
                      trailing: IconButton(
                        icon: Image.asset(
                          'assets/images/next.png',
                          width: 24,
                          height: 24,
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed('PaymentPage');
                        },
                      ),
                      leading: Image.asset(
                        'assets/images/wallet.png',
                        height: 35,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                      onTap: () {},
                    ),
                    ListTile(
                      shape: Border(
                        bottom: BorderSide(
                          color: const Color(0xffe9e9e9),
                        ),
                      ),
                      title: Text('Notifications'),
                      trailing: IconButton(
                        icon: Image.asset(
                          'assets/images/next.png',
                          width: 24,
                          height: 24,
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed('notification');
                        },
                      ),
                      leading: Image.asset(
                        'assets/images/notification (1).png',
                        height: 35,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                      onTap: () {},
                    ),
                    ListTile(
                      shape: Border(
                        bottom: BorderSide(
                          color: const Color(0xffe9e9e9),
                        ),
                      ),
                      title: Text('Help and Support'),
                      trailing: IconButton(
                        icon: Image.asset(
                          'assets/images/next.png',
                          width: 24,
                          height: 24,
                        ),
                        onPressed: () {},
                      ),
                      leading: Image.asset(
                        'assets/images/support.png',
                        height: 35,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                      onTap: () {},
                    ),
                    ListTile(
                      shape: Border(
                        bottom: BorderSide(
                          color: const Color(0xffe9e9e9),
                        ),
                      ),
                      title: Text('Settings'),
                      trailing: IconButton(
                        icon: Image.asset(
                          'assets/images/next.png',
                          width: 24,
                          height: 24,
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed('setting');
                        },
                      ),
                      leading: Image.asset(
                        'assets/images/setting.png',
                        height: 35,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                      onTap: () {},
                    ),
                    ListTile(
                      shape: Border(
                        bottom: BorderSide(
                          color: const Color(0xffe9e9e9),
                        ),
                      ),
                      title: Text('Logout'),
                      trailing: IconButton(
                        icon: Image.asset(
                          'assets/images/next.png',
                          width: 24,
                          height: 24,
                        ),
                        onPressed: () {},
                      ),
                      leading: Image.asset(
                        'assets/images/log-out.png',
                        height: 35,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                      onTap: () {},
                    ),
                    // SizedBox(
                    //   height: 310,
                    // ),
                    // Container(
                    //     height: 5,
                    //     width: 180,
                    //     decoration: const BoxDecoration(
                    //         color: MyColor.myGrey,
                    //         borderRadius:
                    //             BorderRadius.all(Radius.circular(10)))),
                  ],
                ),
              ),
            ])));
  }
}
