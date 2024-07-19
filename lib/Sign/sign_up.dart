import 'package:flutter/material.dart';
import 'package:tuk_ride/Sign/sign_in.dart';
import 'package:tuk_ride/Sign/start.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool agreeWithTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  child: Padding(
                      padding: const EdgeInsets.only(
                          top: 40, right: 290), // Adjust the distance as needed
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
              Container(
                child: Text(
                  'Create Account',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
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
                    decoration: InputDecoration.collapsed(
                  hintText: 'Last Name',
                  hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
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
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('verifyCode');
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
                icon: Icon(
                  Icons.g_mobiledata_rounded,
                  color: Colors.blue,
                ),
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
