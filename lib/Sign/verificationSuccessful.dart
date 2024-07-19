import 'package:flutter/material.dart';

class VerificationSuccessful extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Container(
          child: Padding(
              padding: const EdgeInsets.only(top: 40, right: 290),
              child: ElevatedButton(
                  onPressed: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: ((context) => StartSignUp()))); will make it to go to homePage
                  },
                  child: Icon(Icons.arrow_back_ios_new_outlined,
                      color: Color(0xff242424)),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(0),
                    backgroundColor: Color(0xfff9c32b),
                  )))),
      SizedBox(height: 80.0),
      Center(
        child: Column(
          children: [
            // SizedBox(height: 30.0),
            Text(
              'Verification Successful',
              style: TextStyle(
                fontSize: 30,
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
              child: Icon(
                Icons.check,
                color: Color(0xFFFDFDFD),
                size: 80,
              ),
            ),
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
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.black,
                      size: 20,
                    ),
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
