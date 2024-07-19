import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            // color: Color(0xFFF9C32B),
            borderRadius: BorderRadius.circular(25.0),
          ),
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                  child: Padding(
                      padding: const EdgeInsets.only(
                          top: 30, right: 290), // Adjust the distance as needed
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed("signIn");
                        },
                        child: IconButton(
                          icon: Image.asset(
                            'assets/images/back.png',
                            width: 30,
                            height: 30,
                          ),
                          onPressed: () {},
                        ),
                      ))),
              Center(
                child: Column(
                  children: [
                    SizedBox(height: 40.0),
                    Container(
                      child: Text(
                        'Forget Password',
                        style: TextStyle(
                          fontSize: 40,
                          letterSpacing: 2.5,
                          wordSpacing: 10,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'MPLUSRounded1c',
                        ),
                      ),
                    ),
                    Container(
                        height: 5,
                        width: 230,
                        decoration: const BoxDecoration(
                            color: Color(0xfff9c32b),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    Text(
                      'Enter your Email address or Phone Number',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFC8C7CC),
                        fontFamily: 'MPLUSRounded1c',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Email address or Phone Number",
                            hintStyle: TextStyle(
                              color: Color(0xFFC8C7CC),
                              fontSize: 17,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Color(0xFFC8C7CC)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Color(0xFFC8C7CC)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 65.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed('resetPassword');
                        },
                        child: const Text(
                          'Send',
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
                                  EdgeInsets.all(10.0)),
                          minimumSize: MaterialStateProperty.all<Size>(
                              Size(350.0, 20.0)),
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
            ],
          )),
    );
  }
}
