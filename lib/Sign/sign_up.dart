import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuk_ride/Sign/sign_in.dart';
import 'package:tuk_ride/Sign/start.dart';
import 'package:http/http.dart' as http;
import 'package:tuk_ride/shared_pref_helper.dart';

String url = "https://cd22-62-139-46-157.ngrok-free.app";

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool agreeWithTerms = false;
  var fNameController = TextEditingController();
  var lNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var mobileNumberController = TextEditingController();

  Future<bool> _signup() async {
    var request = http.Request('POST', Uri.parse('$url/user/signup'));

    request.headers['Content-Type'] = 'application/json';

    request.body = '''{
    "name": "${fNameController.text}",
    "useremail": "${emailController.text}",
    "userphone": "${mobileNumberController.text}",
    "password": "${passwordController.text}",
    "passwordConfirm": "${passwordController.text}"
  }''';

    http.StreamedResponse response = await request.send();

    log(response.statusCode.toString());
    String responseString = await response.stream.bytesToString();
    log(responseString);

    if (response.statusCode == 201) {
      // Decode the JSON response
      var responseJson = jsonDecode(responseString);

      // Extract token and user data
      String token = responseJson['token'];
      String useremail = responseJson['data']['userOrDriver']['useremail'];
      String userphone = responseJson['data']['userOrDriver']['userphone'];
      String profile = responseJson['data']['userOrDriver']['profile'];

      // Store token and user data in Shared Preferences

      await SharedPrefHelper.saveData(key: 'token', value: token);
      await SharedPrefHelper.saveData(key: 'useremail', value: useremail);
      await SharedPrefHelper.saveData(key: 'userphone', value: userphone);
      await SharedPrefHelper.saveData(key: 'profile', value: profile);

      log("Signup successful and token/data stored in Shared Preferences");
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 40, right: 290), // Adjust the distance as needed
                child: IconButton(
                  icon: Image.asset('assets/images/back.png'),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => StartSignUp())));
                  },
                ),
              ),
              // SizedBox(
              //   width: 5,
              // ),
              Container(
                child: Text(
                  'Create Account',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Container(
                  height: 5,
                  width: 300,
                  decoration: const BoxDecoration(
                      color: Color(0xfff9c32b),
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
              Text(
                'Fill your information to Sign up',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffe9e9e9)),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: fNameController,
                    decoration: InputDecoration.collapsed(
                      hintText: 'First Name',
                      hintStyle:
                          Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Color.fromRGBO(233, 233, 233, 1),
                              ),
                    ),
                  )),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xffe9e9e9)),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                    controller: emailController,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Email',
                      hintStyle:
                          Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Color.fromRGBO(233, 233, 233, 1),
                              ),
                    )),
              ),
              const SizedBox(height: 20),
              Container(
                  height: 50,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffe9e9e9)),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    controller: mobileNumberController,
                    maxLength: 11,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Mobile Number',
                      hintStyle:
                          Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Color.fromRGBO(233, 233, 233, 1),
                              ),
                    ),
                  )),
              const SizedBox(height: 20),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xffe9e9e9)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: passwordController,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Password',
                      hintStyle:
                          Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Color.fromRGBO(233, 233, 233, 1),
                              ),
                    ),
                    obscureText: true,
                  ),
                ),
              ),
              Row(children: [
                Checkbox(
                  checkColor: Color.fromARGB(248, 246, 246, 245),
                  activeColor: Color(0xfff9c32b),
                  value: agreeWithTerms,
                  onChanged: (bool? newValue) {
                    setState(() {
                      agreeWithTerms = newValue!;
                    });
                  },
                ),
                Text('Agree with'),
                Padding(
                    padding: EdgeInsets.only(right: 50),
                    child: TextButton(
                      onPressed: () {
                        //Terms & Condition
                      },
                      child: const Text(
                        'Terms & Condition',
                        style: TextStyle(
                          fontFamily: 'MPLUSRounded1c',
                          color: Color(0xfff9c32b),
                          fontSize: 15,
                        ),
                      ),
                    ))
              ]),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  // Navigator.of(context).pushReplacementNamed('verifyCode');
                  await _signup()
                      ? Navigator.of(context).pushReplacementNamed('NavBar')
                      : null;
                },
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                  backgroundColor: const Color(0xfff9c32b),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 122, vertical: 15),
                ),
                child: Text('Sign Up',
                    style: Theme.of(context).textTheme.titleSmall),
              ),
              SizedBox(height: 15),
              const Text(' Or'),
              const SizedBox(height: 15),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 15)),
                onPressed: () {},
                label: const Text('Sign In with Google',
                    style: TextStyle(
                      color: Color(0xff242424),
                      fontFamily: 'MPLUSRounded1c',
                    )),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => SignInScreen())));
                    },
                    child: const Text('Sign In',
                        style: TextStyle(
                          color: Color(0xfff9c32b),
                          fontFamily: 'MPLUSRounded1c',
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
