// import 'package:flutter/material.dart';
// import 'package:tuk_ride/Maps/Schedule_Ride.dart';
// import 'package:tuk_ride/NavBar/NavList.dart';
// import 'package:tuk_ride/NavBar/NavSearch.dart';
// import 'package:tuk_ride/NavBar/schudule.dart';
// import 'package:tuk_ride/constant/MyColors.dart';
// import 'NavHome.dart';
// import '../Passenger/AccountMenu.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class NavBar extends StatefulWidget {
//   const NavBar({Key? key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<NavBar> {
//   int pageIndex = 0;

//   final pages = [
//     Page1(),
//     Page2(),
//     // ScheduleRideScreenNav(),
//     Page3(),
//     AccountMenu(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: pages[pageIndex],
//         bottomNavigationBar: Container(
//           height: 64,
//           decoration: BoxDecoration(
//               color: Color.fromRGBO(255, 255, 255, 1),
//               borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(25), topRight: Radius.circular(25))),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   IconButton(
//                       enableFeedback: false,
//                       onPressed: () {
//                         setState(() {
//                           pageIndex = 0;
//                         });
//                       },
//                       icon: pageIndex == 0
//                           ? SvgPicture.asset(
//                               'assets/images/homeIcon.svg',
//                               color: Color(0xfff9c32b),
//                               height: 35,
//                             )
//                           : SvgPicture.asset(
//                               'assets/images/homeIcon.svg',
//                               color: Color(0xffe9e9e9),
//                               height: 35,
//                             )),
//                   IconButton(
//                       enableFeedback: false,
//                       onPressed: () {
//                         setState(() {
//                           pageIndex = 1;
//                         });
//                       },
//                       icon: pageIndex == 1
//                           ? Image.asset(
//                               'assets/images/search.png',
//                               color: Color(0xfff9c32b),
//                               height: 35,
//                             )
//                           : Image.asset(
//                               'assets/images/search.png',
//                               color: Color(0xffe9e9e9),
//                               height: 35,
//                             )),
//                   IconButton(
//                       enableFeedback: false,
//                       onPressed: () {
//                         setState(() {
//                           pageIndex = 2;
//                         });
//                       },
//                       icon: pageIndex == 2
//                           ? Image.asset(
//                               'assets/images/activity.png',
//                               color: Color(0xfff9c32b),
//                               height: 35,
//                             )
//                           : Image.asset(
//                               'assets/images/activity.png',
//                               color: Color(0xffe9e9e9),
//                               height: 35,
//                             )),
//                   IconButton(
//                       enableFeedback: false,
//                       onPressed: () {
//                         setState(() {
//                           pageIndex = 3;
//                         });
//                       },
//                       icon: pageIndex == 3
//                           ? SvgPicture.asset(
//                               'assets/images/user.svg',
//                               color: Color(0xfff9c32b),
//                               height: 35,
//                             )
//                           : SvgPicture.asset(
//                               'assets/images/user.svg',
//                               color: Color(0xffe9e9e9),
//                               height: 35,
//                             )),
//                 ],
//               ),
//               Spacer(),
//               Container(
//                   height: 5,
//                   width: 180,
//                   decoration: const BoxDecoration(
//                       color: MyColor.myGrey,
//                       borderRadius: BorderRadius.all(Radius.circular(10)))),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

import 'package:tuk_ride/NavBar/NavList.dart';
import 'package:tuk_ride/NavBar/NavSearch.dart';
import 'package:tuk_ride/constant/MyColors.dart';
import 'NavHome.dart';
import '../Passenger/AccountMenu.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int pageIndex = 0;
  PageController _pageController = PageController();

  final pages = [
    Page1(),
    Page2(),
    Page3(),
    AccountMenu(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          children: pages,
          onPageChanged: (index) {
            setState(() {
              pageIndex = index;
            });
          },
        ),
        bottomNavigationBar: Container(
          height: 64,
          decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 1),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    enableFeedback: false,
                    onPressed: () {
                      _pageController.jumpToPage(0);
                    },
                    icon: pageIndex == 0
                        ? SvgPicture.asset(
                            'assets/images/homeIcon.svg',
                            color: Color(0xfff9c32b),
                            height: 35,
                          )
                        : SvgPicture.asset(
                            'assets/images/homeIcon.svg',
                            color: Color(0xffe9e9e9),
                            height: 35,
                          ),
                  ),
                  IconButton(
                    enableFeedback: false,
                    onPressed: () {
                      _pageController.jumpToPage(1);
                    },
                    icon: pageIndex == 1
                        ? Image.asset(
                            'assets/images/search.png',
                            color: Color(0xfff9c32b),
                            height: 35,
                          )
                        : Image.asset(
                            'assets/images/search.png',
                            color: Color(0xffe9e9e9),
                            height: 35,
                          ),
                  ),
                  IconButton(
                    enableFeedback: false,
                    onPressed: () {
                      _pageController.jumpToPage(2);
                    },
                    icon: pageIndex == 2
                        ? Image.asset(
                            'assets/images/activity.png',
                            color: Color(0xfff9c32b),
                            height: 35,
                          )
                        : Image.asset(
                            'assets/images/activity.png',
                            color: Color(0xffe9e9e9),
                            height: 35,
                          ),
                  ),
                  IconButton(
                    enableFeedback: false,
                    onPressed: () {
                      _pageController.jumpToPage(3);
                    },
                    icon: pageIndex == 3
                        ? SvgPicture.asset(
                            'assets/images/user.svg',
                            color: Color(0xfff9c32b),
                            height: 35,
                          )
                        : SvgPicture.asset(
                            'assets/images/user.svg',
                            color: Color(0xffe9e9e9),
                            height: 35,
                          ),
                  ),
                ],
              ),
              Spacer(),
              Container(
                height: 5,
                width: 180,
                decoration: const BoxDecoration(
                  color: MyColor.myGrey,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
