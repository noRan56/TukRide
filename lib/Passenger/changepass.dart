import 'package:flutter/material.dart';
import 'package:tuk_ride/constant/MyColors.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscureOldPassword = true;
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'Change Password',
      //     style: TextStyle(color: Colors.black),
      //   ),
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   leading: IconButton(
      //     icon: Image.asset('assets/images/back.png'),
      //     onPressed: () {
      //       Navigator.of(context).pushReplacementNamed('setting');
      //     },
      //   ),
      //   centerTitle: true,
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 50, right: 100), // Adjust the distance as needed
                child: Row(
                  children: [
                    IconButton(
                      icon: Image.asset('assets/images/back.png'),
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('setting');
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Container(
                          child: const Text('Change Password',
                              style: TextStyle(
                                  color: Color(0xff242424),
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20)),
                        ),
                        Container(
                            height: 5,
                            width: 180,
                            decoration: const BoxDecoration(
                                color: Color(0xfff9c32b),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              _buildPasswordField(
                controller: _oldPasswordController,
                labelText: 'Old Password',
                obscureText: _obscureOldPassword,
                onToggleVisibility: () {
                  setState(() {
                    _obscureOldPassword = !_obscureOldPassword;
                  });
                },
              ),
              SizedBox(height: 16.0),
              _buildPasswordField(
                controller: _newPasswordController,
                labelText: 'New Password',
                obscureText: _obscureNewPassword,
                onToggleVisibility: () {
                  setState(() {
                    _obscureNewPassword = !_obscureNewPassword;
                  });
                },
              ),
              SizedBox(height: 16.0),
              _buildPasswordField(
                controller: _confirmPasswordController,
                labelText: 'Confirm Password',
                obscureText: _obscureConfirmPassword,
                onToggleVisibility: () {
                  setState(() {
                    _obscureConfirmPassword = !_obscureConfirmPassword;
                  });
                },
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {},
                child: Text('Save Changes'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColor.myYellow,
                  foregroundColor: MyColor.myBlack,
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String labelText,
    required bool obscureText,
    required VoidCallback onToggleVisibility,
  }) {
    return TextField(
      cursorColor: MyColor.myGrey,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        focusColor: MyColor.myGrey,
        fillColor: MyColor.myGrey,
        labelText: labelText,
        labelStyle: TextStyle(color: MyColor.myGrey),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: MyColor.myGrey), // Border color when focused
        ),
        border:
            OutlineInputBorder(borderSide: BorderSide(color: MyColor.myGrey)),
        suffixIcon: IconButton(
          icon: Image.asset(
            obscureText ? 'assets/images/eye.png' : 'assets/images/eye.png',
            height: 20,
            width: 20,
          ),
          onPressed: onToggleVisibility,
        ),
      ),
    );
  }
}
