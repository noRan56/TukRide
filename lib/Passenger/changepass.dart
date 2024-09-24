import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tuk_ride/core/constant/MyColors.dart';
import 'package:tuk_ride/core/helpers/api_url.dart';
import 'package:tuk_ride/shared_pref_helper.dart';

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

  Future<bool> _changePassword() async {
    var request =
        http.Request('PATCH', Uri.parse('${UrlApi.url}/user/updateMyPassword'));

    request.headers['Content-Type'] = 'application/json';
    request.headers['Authorization'] =
        'Bearer ' + await SharedPrefHelper.getData(key: 'token');

    request.body = json.encode({
      "passwordCurrent": '${_oldPasswordController.text}',
      "password": '${_newPasswordController.text}',
      "passwordConfirm": '${_confirmPasswordController.text}'
    });

    try {
      http.StreamedResponse response = await request.send();
      String responseString = await response.stream.bytesToString();

      if (response.statusCode == 201) {
        var responseJson = jsonDecode(responseString);
        String token = responseJson['token'];
        await SharedPrefHelper.saveData(key: 'token', value: token);

        log("Password change successful and token stored in Shared Preferences");
        return true;
      } else {
        log("Error: ${response.reasonPhrase}");
        return false;
      }
    } catch (e) {
      log("Exception: $e");
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
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, right: 100),
                child: Row(
                  children: [
                    IconButton(
                      icon: Image.asset('assets/images/back.png'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    SizedBox(width: 20),
                    Column(
                      children: [
                        Container(
                          child: const Text(
                            'Change Password',
                            style: TextStyle(
                              color: Color(0xff242424),
                              fontWeight: FontWeight.w800,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Container(
                          height: 5,
                          width: 180,
                          decoration: const BoxDecoration(
                            color: Color(0xfff9c32b),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
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
                onPressed: () async {
                  bool success = await _changePassword();

                  if (success) {
                    Navigator.of(context).pushReplacementNamed(
                      'signIn',
                      arguments: {'passwordChanged': true},
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Change Successful'),
                        backgroundColor: MyColor.myYellow,
                      ),
                    );
                  }
                },
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
          borderSide: BorderSide(color: MyColor.myGrey),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: MyColor.myGrey),
        ),
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
