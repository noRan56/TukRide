import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tuk_ride/Sign/sign_up.dart';
import 'package:tuk_ride/Sign/start.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:tuk_ride/core/helpers/api_url.dart';
import 'package:tuk_ride/shared_pref_helper.dart';

import 'package:tuk_ride/core/constant/MyColors.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  Future<bool> _signin() async {
    var request = http.Request('POST', Uri.parse('${UrlApi.url}/user/login'));

    request.headers['Content-Type'] = 'application/json';
    request.headers['Authorization'] =
        'Bearer ' + await SharedPrefHelper.getData(key: 'token');

    request.body = json.encode({
      "useremail": '${emailController.text}',
      "password": '${passwordController.text}'
    });

    http.StreamedResponse response = await request.send();

    log(response.statusCode.toString());
    String responseString = await response.stream.bytesToString();
    log(responseString);

    if (response.statusCode == 200 || response.statusCode == 201) {
      // Decode the JSON response
      var responseJson = jsonDecode(responseString);
      log(responseJson.toString());
      // Extract token and user data
      String token = responseJson['token'];

      // // Store token and user data in Shared Preferences

      await SharedPrefHelper.saveData(key: 'token', value: token);

      // await SharedPrefHelper.saveData(key: 'userphone', value: userphone);
      // await SharedPrefHelper.saveData(key: 'profile', value: profile);

      // log("Signup successful and token/data stored in Shared Preferences");
      return true;
    } else {
      log("Error: ${response.reasonPhrase}");
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 50, right: 290), // Adjust the distance as needed
                  child: IconButton(
                    icon: Image.asset('assets/images/back.png'),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => StartSignUp())));
                    },
                  ),
                ),
              ),
              // SizedBox(
              //   height: 5,
              // ),
              Container(
                child: const Text('Sign In',
                    style: TextStyle(
                        color: Color(0xff242424),
                        fontWeight: FontWeight.w800,
                        fontSize: 30)),
              ),
              Container(
                  height: 5,
                  width: 180,
                  decoration: const BoxDecoration(
                      color: MyColor.myYellow,
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
              const Text(
                'Hi! Welcome back',
                style: TextStyle(
                    color: MyColor.myGrey,
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 20),
              Container(
                  height: 50,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                  decoration: BoxDecoration(
                      border: Border.all(color: MyColor.myGrey),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: InputDecoration.collapsed(
                        hintText: 'Email',
                        hintStyle: TextStyle(
                            color: MyColor.myGrey,
                            fontSize: 17,
                            fontWeight: FontWeight.w400)),
                  )),
              const SizedBox(height: 20),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: MyColor.myGrey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: passwordController,
                    decoration: InputDecoration.collapsed(
                        hintText: 'Password',
                        hintStyle: TextStyle(
                            color: MyColor.myGrey,
                            fontSize: 17,
                            fontWeight: FontWeight.w400)),
                    obscureText: true,
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 1, left: 210),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed('forgetPassword');
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Color(0xfff9c32b),
                        fontSize: 15,
                      ),
                    ),
                  )),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  // Navigator.of(context).pushReplacementNamed(
                  //     'EnableLocationaccess'); // TODO : Sign in button logic

                  await _signin()
                      ? Navigator.of(context).pushReplacementNamed('NavBar')
                      : null;
                },
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  backgroundColor: const Color(0xfff9c32b),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                ),
                child: const Text('Sign In',
                    style: TextStyle(
                      color: Color(
                        0xff242424,
                      ),
                    )),
              ),
              const SizedBox(height: 30),
              const Text('Or'),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    //backgroundColor: Color(0xffe9e9e9),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20)),
                onPressed: () {},
                icon: Image.asset(
                  'assets/images/google.png',
                  width: 24,
                  height: 24,
                ),
                label: const Text('Sign In with Google',
                    style: TextStyle(
                      color: Color(0xff242424),
                    )),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => SignUpPage())));
                    },
                    child: const Text('Sign Up',
                        style: TextStyle(
                          color: Color(0xfff9c32b),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
