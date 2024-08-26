import 'package:flutter/material.dart';
import 'package:tuk_ride/Sign/start.dart';

class VerificationSuccessful extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Container(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 40, right: 290), // Adjust the distance as needed
          child: IconButton(
            icon: Image.asset('assets/images/back.png'),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: ((context) => StartSignUp())));
            },
          ),
        ),
      ),
      SizedBox(height: 80.0),
      Center(
        child: Column(
          children: [
            // SizedBox(height: 30.0),
            Text(
              'Verification Successful',
              style: TextStyle(
                fontSize: 20,
                letterSpacing: 1.5,
                wordSpacing: 5,
                fontWeight: FontWeight.w500,
                fontFamily: 'MPLUSRounded1c',
              ),
            ),
            SizedBox(height: 65.0),
            Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF9C32B),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                padding: EdgeInsets.all(10.0),
                child: Image.asset(
                  "assets/images/checked.png",
                  width: 70,
                  height: 70,
                )),
            SizedBox(height: 95.0),
            FractionallySizedBox(
              widthFactor: 0.8,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed('signIn'); //   action
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'MPLUSRounded1c',
                      ),
                    ),
                    SizedBox(
                        width: 10), // Adjust the spacing between text and icon
                  ],
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xFFF9C32B)),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(vertical: 12.0, horizontal: 35.0),
                  ),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ]));
  }
}
