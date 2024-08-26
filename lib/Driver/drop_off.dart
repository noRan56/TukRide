import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tuk_ride/constant/myMap.dart';
import 'package:tuk_ride/helpers/topbar.dart';

class DropOff extends StatefulWidget {
  @override
  State<DropOff> createState() => _DropOffState();
}

class _DropOffState extends State<DropOff> {
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
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/userAvater.png'),
                      ),
                      SizedBox(width: 16.0),
                      Text(
                        'dunya zad',
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
                  Column(children: [
                    Row(
                      children: [
                        Image.asset('assets/images/ic_current.png',
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
                              'The unknown realm',
                              style: TextStyle(
                                color: Color(0xff242424),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      children: [
                        Image.asset('assets/images/pin.png',
                            height: 25, color: Color(0xff242424)),
                        SizedBox(width: 8.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'DROP-OFF',
                              style: TextStyle(
                                color: Color(0xffc8c7cc),
                              ),
                            ),
                            Text(
                              'The other realm',
                              style: TextStyle(
                                color: Color(0xff242424),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ]),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Arrival in',
                            style: TextStyle(
                              color: Color(0xffe9e9e9),
                            ),
                          ),
                          Text(
                            '5 min',
                            style: TextStyle(
                              color: Color(0xff242424),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Distance',
                            style: TextStyle(
                              color: Color(0xffc8c7cc),
                            ),
                          ),
                          Text(
                            '2.2 km',
                            style: TextStyle(
                              color: Color(0xff242424),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Fare',
                            style: TextStyle(
                              color: Color(0xffc8c7cc),
                            ),
                          ),
                          Text(
                            '40\$',
                            style: TextStyle(
                              color: Color(0xff242424),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed('NavBarDriver');
                      },
                      child: Text(
                        'Drop off',
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
            ),
          ),
        ],
      ),
    );
  }
}
