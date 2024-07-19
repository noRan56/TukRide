import 'package:flutter/material.dart';
import 'package:tuk_ride/Sign/start.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.only(bottom: 250),
          child: Column(
            children: [
              ListView(shrinkWrap: true, children: [
                Container(
                    child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10,
                            right: 290), // Adjust the distance as needed
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: ((context) => StartSignUp())));
                            },
                            child: Icon(Icons.arrow_back_ios_new_outlined,
                                color: Color(0xff242424)),
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(0),
                              backgroundColor: Color(0xfff9c32b),
                            )))),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 20.0),
                        Text(
                          'Reset Password',
                          style: TextStyle(
                            fontSize: 35,
                            letterSpacing: 2.5,
                            wordSpacing: 10,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'MPLUSRounded1c',
                          ),
                        ),
                        Container(
                            height: 5,
                            width: 230,
                            decoration: const BoxDecoration(
                                color: Color(0xfff9c32b),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                        SizedBox(height: 3),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Text(
                            'Your new password must be different from previously used passwords',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFC8C7CC),
                              fontFamily: 'MPLUSRounded1c',
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 30.0),
                        buildTextField(
                          "New Password",
                          Icons.visibility_off,
                          isSuffix: true,
                        ),
                        SizedBox(height: 20.0),
                        buildTextField("Confirm Password", Icons.visibility_off,
                            isSuffix: true),
                        SizedBox(height: 30.0),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed('signIn');
                            // Add reset password logic here
                          },
                          child: Text(
                            'Reset',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'MPLUSRounded1c',
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xFFF9C32B)),
                            padding:
                                MaterialStateProperty.all<EdgeInsetsGeometry>(
                                    EdgeInsets.all(15.0)),
                            minimumSize: MaterialStateProperty.all<Size>(
                                Size(350.0, 60.0)),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SvgPicture.asset(
                    'assets/images/Reset password-pana 1.svg',
                    width: 386,
                    height: 257,
                    fit: BoxFit.cover,
                  ),
                )
              ]),
            ],
          )),
    ));
  }

  Widget buildTextField(String hintText, IconData icon,
      {bool isSuffix = false}) {
    return Container(
      width: double.infinity,
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Color(0xFFC8C7CC),
            fontSize: 17,
          ),
          suffixIcon: isSuffix
              ? Icon(
                  icon,
                  color: Color(0xFFC8C7CC),
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Color(0xFFC8C7CC)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Color(0xFFC8C7CC)),
          ),
          contentPadding:
              EdgeInsets.symmetric(vertical: 14.0, horizontal: 20.0),
        ),
      ),
    );
  }
}
