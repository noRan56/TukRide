import 'package:flutter/material.dart';
import 'package:tuk_ride/core/constant/MyColors.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isLocationTrackingEnabled = false;
  bool isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.myWhite,
      appBar: AppBar(
        backgroundColor: MyColor.myWhite,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(
            'assets/images/back.png',
            width: 30,
            height: 30,
          ),
          onPressed: () {
            // Handle back button press
          },
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 65),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Settings',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                color: Color(0xFFF9C32B),
                height: 5.0,
                width: 100.0,
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ListTile(
              leading: Image.asset(
                'assets/images/password.png',
                height: 35,
              ),
              title: Text('Change Password'),
              trailing: Image.asset(
                'assets/images/next.png',
                width: 24,
                height: 24,
              ),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed('ChangePasswordPage');
              },
            ),
            Divider(),
            ListTile(
              leading: Image.asset(
                'assets/images/locaition12.png',
                height: 35,
              ),
              title: Text('Location tracking'),
              trailing: Switch(
                value: isLocationTrackingEnabled,
                onChanged: (bool value) {
                  setState(() {
                    isLocationTrackingEnabled = value;
                  });
                },
                activeColor: Color(0xfff9c32b),
              ),
            ),
            Divider(),
            ListTile(
              leading: Image.asset(
                'assets/images/night-mode.png',
                height: 35,
              ),
              title: Text('Dark Mode'),
              trailing: Switch(
                value: isDarkModeEnabled,
                onChanged: (bool value) {
                  setState(() {
                    isDarkModeEnabled = value;
                  });
                },
                activeColor: Color(0xfff9c32b),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
