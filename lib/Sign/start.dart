import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tuk_ride/Driver/sign_up.dart';
import 'package:tuk_ride/Sign/sign_up.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StartSignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(top: 40, right: 290),
          child: IconButton(
            icon: Image.asset('assets/images/back.png'),
            onPressed: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: ((context) => StartSignUp())));
            },
          ),
        ),
        SvgPicture.asset(
          'assets/images/TUK.svg',
          width: 120,
          height: 70,
        ),
        SvgPicture.asset(
          'assets/images/Add User-pana 1.svg',
          width: 436,
          height: 436,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xfff9c32b),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40))),
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 20)),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => SignUPScreenDriver())));
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Sign Up For Driver',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(width: 3),
              ],
            )),
        SizedBox(height: 20),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xfff9c32b),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40))),
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20)),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: ((context) => SignUpPage())));
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Sign Up For Passanger',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(width: 3),
              ],
            )),
      ])),
    )));
  }
}
