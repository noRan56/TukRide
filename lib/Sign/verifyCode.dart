import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class verifyCode extends StatefulWidget {
  const verifyCode({super.key});

  @override
  State<verifyCode> createState() => _verifyCodeState();
}

class _verifyCodeState extends State<verifyCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.,
      body: SingleChildScrollView(
          padding: EdgeInsets.all(0),
          child: Container(
              margin: EdgeInsets.only(top: 20),
              width: double.infinity,
              child: Column(children: [
                Container(
                    child: Padding(
                        padding: const EdgeInsets.only(top: 40, right: 290),
                        child: ElevatedButton(
                            onPressed: () {
                              //   handle
                            },
                            child: Icon(Icons.arrow_back_ios_new_outlined,
                                color: Color(0xff242424)),
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(0),
                              backgroundColor: Color(0xfff9c32b),
                            )))),
                Text(
                  "Verify Code",
                  style: TextStyle(
                    fontSize: 30,
                    letterSpacing: 2.5,
                    wordSpacing: 10,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'MPLUSRounded1c',
                  ),
                ),
                Container(
                    height: 5,
                    width: 180,
                    decoration: const BoxDecoration(
                        color: Color(0xfff9c32b),
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                Text(
                  "Please enter the code we just sent to phone number ",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(101, 101, 101, 1),
                    fontFamily: 'MPLUSRounded1c',
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  //  for ( pin.length);
                  children: List.generate(6, (index) {
                    return Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SizedBox(
                          height: 50,
                          width: 46,
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color:
                                        Colors.grey, // Choose your border color
                                    width: 2.0,
                                    // Choose the border width
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: TextField(
                                style: TextStyle(fontSize: 25),
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                obscureText: true,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                              ))),
                    );
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 250),
                  child: Text(
                    "Resend code in : 60sec",
                    style: TextStyle(
                      fontSize: 13,
                      color: Color.fromRGBO(0, 0, 0, .5),
                      fontFamily: 'MPLUSRounded1c',
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                Center(
                  child: Text("Didn't receive code ?  ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(101, 101, 101, 1),
                        fontFamily: 'MPLUSRounded1c',
                        fontSize: 15,
                      )),
                ),
                Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: TextButton(
                      onPressed: () {
                        //   handle resend code in backend
                      },
                      child: const Text(
                        'Resend code ?',
                        style: TextStyle(
                          color: Color(0xfff9c32b),
                          fontSize: 15,
                          fontFamily: 'MPLUSRounded1c',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed('VerificationSuccessful');
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    backgroundColor: const Color(0xfff9c32b),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 20),
                  ),
                  child: const Text('Confirm ',
                      style: TextStyle(
                          fontFamily: 'MPLUSRounded1c',
                          color: Color(
                            0xff242424,
                          ))),
                ),
                SvgPicture.asset(
                  'assets/images/enterOTp.svg',
                ),
              ]))),
    );
  }
}
