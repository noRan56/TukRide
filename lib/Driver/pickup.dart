import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tuk_ride/core/constant/MyColors.dart';

import 'package:tuk_ride/core/constant/myMap.dart';
import 'package:tuk_ride/core/helpers/topbar.dart';

class PickUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Mymap(),
          TopBar(),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    spreadRadius: 5.0,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/userAvater.png'),
                          ),
                          SizedBox(width: 16.0),
                          Text(
                            'Dina Ali',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '40\$',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Container(
                      height: 2,
                      width: 400,
                      decoration: const BoxDecoration(
                          color: Color(0xffe9e9e9),
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  SizedBox(height: 16.0),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/images/Current_location.png',
                                height: 25, color: Color(0xfff9c23b)),
                            SizedBox(width: 8.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'PICK-UP',
                                  style: TextStyle(
                                    color: Color(0xffe9e9e9),
                                  ),
                                ),
                                Text(
                                  'كفر مصلحة',
                                  style: TextStyle(
                                    color: Color(0xff242424),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        Divider(
                          color: MyColor.myLineColor,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              Image.asset('assets/images/pin.png',
                                  height: 25, color: Color(0xff242424)),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    ' DROP-OFF',
                                    style: TextStyle(
                                      color: Color(0xffc8c7cc),
                                    ),
                                  ),
                                  Text(
                                    'المجمع',
                                    style: TextStyle(
                                      color: Color(0xff242424),
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      //  call button
                                    },
                                    child: Image.asset(
                                      'assets/images/call.png',
                                      height: 25,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      //  call button
                                    },
                                    child: Image.asset(
                                      'assets/images/chat.png',
                                      height: 25,
                                    ),
                                  ),
                                ])
                          ],
                        ),
                      ]),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 8.0),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed('DropOff');
                          },
                          child: Text(
                            'Pick Up',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff242424)),
                          ),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Color(0xff242424),
                            backgroundColor: Color(0xfff9c32b),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 120.0, vertical: 22.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
