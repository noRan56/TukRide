import 'package:flutter/material.dart';

class EnableLocationaccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          children: [
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
            Container(
              margin: EdgeInsets.only(
                top: 50,
              ),
              width: 161,
              height: 161,
              decoration: BoxDecoration(
                color: Color(0xEEE9E9E9),
                borderRadius: BorderRadius.circular(70.0),
              ),
              padding: EdgeInsets.all(10.0),
              child: Icon(
                Icons.location_on,
                color: Color(0xFFF9C32B),
                size: 120,
              ),
            ),
            // SvgPicture.assets(''),

            // SizedBox(height: 95.0),
            SizedBox(height: 40.0),
            Container(
              child: Text(
                'Enable Location Access',
                style: TextStyle(
                  fontSize: 25,
                  letterSpacing: 1,
                  fontFamily: 'MPLUSRounded1c',
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Text(
                'To ensure a seamless and efficient experience, allow us acess to your location',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFC8C7CC),
                  fontFamily: 'MPLUSRounded1c',
                ),
                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(height: 100.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('NavBar');
                },
                child: const Text(
                  'Allow Location Access',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'MPLUSRounded1c',
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xFFF9C32B)),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.all(10.0)),
                  minimumSize:
                      MaterialStateProperty.all<Size>(Size(350.0, 20.0)),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // ]),
    );
  }
}
