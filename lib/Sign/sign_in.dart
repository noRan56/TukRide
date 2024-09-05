import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tuk_ride/Sign/sign_up.dart';
import 'package:tuk_ride/Sign/start.dart';

class SignInScreen extends StatelessWidget {
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
                      color: Color(0xfff9c32b),
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
              const Text(
                'Hi! Welcome back',
                style: TextStyle(
                    color: Color(0xff656565),
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 20),
              Container(
                  height: 50,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffe9e9e9)),
                      borderRadius: BorderRadius.circular(10)),
                  child: const TextField(
                    keyboardType: TextInputType.phone,
                    maxLength: 11,
                    decoration: InputDecoration.collapsed(
                        hintText: 'Mobile Number',
                        hintStyle: TextStyle(
                            color: Color(0xffe9e9e9),
                            fontSize: 17,
                            fontWeight: FontWeight.w400)),
                  )),
              const SizedBox(height: 20),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xffe9e9e9)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const TextField(
                    decoration: InputDecoration.collapsed(
                        hintText: 'Password',
                        hintStyle: TextStyle(
                            color: Color(0xffe9e9e9),
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
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(
                      'EnableLocationaccess'); // TODO : Sign in button logic
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
                icon: Image.asset('assets/images/google.png'),
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
