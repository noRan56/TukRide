import 'package:flutter/material.dart';
import 'package:tuk_ride/core/helpers/api_url.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:tuk_ride/shared_pref_helper.dart';
import 'package:tuk_ride/core/constant/MyColors.dart';

class ForgetPassword extends StatefulWidget {
  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  var emailController = TextEditingController();
  Future<void> _forgetPassword() async {
    var request =
        http.Request('POST', Uri.parse('${UrlApi.url}/user/forgotPassword'));
    request.body = json.encode({"useremail": "${emailController.text}"});
    request.headers['Content-Type'] = 'application/json';
    request.headers['Authorization'] =
        await SharedPrefHelper.getData(key: 'token');
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                  child: Padding(
                padding: const EdgeInsets.only(
                    top: 80, right: 290), // Adjust the distance as needed

                child: IconButton(
                  icon: Image.asset(
                    'assets/images/back.png',
                  ),
                  onPressed: () {},
                ),
              )),
              Center(
                child: Column(
                  children: [
                    SizedBox(height: 40.0),
                    Container(
                      child: Text(
                        'Forget Password',
                        style: TextStyle(
                          fontSize: 30,
                          letterSpacing: 2.5,
                          wordSpacing: 2,
                          fontWeight: FontWeight.w500,
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
                        color: MyColor.myGrey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: "Email address ",
                            hintStyle: TextStyle(
                              color: MyColor.myGrey,
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
                          _forgetPassword();
                          Navigator.of(context)
                              .pushReplacementNamed('verifyCode');
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
    ));
  }
}
