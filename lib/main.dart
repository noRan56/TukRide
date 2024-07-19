import 'package:flutter/material.dart';
import 'package:tuk_ride/Maps/Ride_Booking.dart';
import 'package:tuk_ride/Maps/Schedule_Ride.dart';
import 'package:tuk_ride/OTP/OTP-Pages.dart';
import 'package:tuk_ride/NavBar/NavBar.dart';
import 'package:tuk_ride/Maps/home.dart';
import 'package:tuk_ride/Passenger/AccountMenu.dart';
import 'package:tuk_ride/Passenger/payment.dart';
import 'package:tuk_ride/Passenger/paymentCard.dart';
import 'package:tuk_ride/Passenger/settings.dart';
import 'package:tuk_ride/Sign/enableLocationAccess.dart';
import 'package:tuk_ride/Sign/forgetPassword.dart';
import 'package:tuk_ride/Sign/resetPassword.dart';
import 'package:tuk_ride/Sign/sign_in.dart';
import 'package:tuk_ride/Sign/start.dart';
import 'package:tuk_ride/Sign/verificationSuccessful.dart';
import 'package:tuk_ride/Sign/verifyCode.dart';
import 'package:tuk_ride/presentation_layer/Screen/notifications_screen.dart';
import 'package:tuk_ride/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OnboardingScreen(),
        theme: ThemeData(
          fontFamily: 'MPLUSRounded1c',
          textTheme: TextTheme(
            titleMedium: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              fontFamily: 'MPLUSRounded1c',
              color: Color.fromRGBO(36, 36, 36, 1),
            ),
            bodySmall: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w300,
                color: Color.fromRGBO(101, 101, 101, 3)),
            titleSmall: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              fontFamily: 'MPLUSRounded1c',
              color: Color.fromRGBO(36, 36, 36, 1),
            ),
            bodyMedium: TextStyle(
                fontFamily: 'MPLUSRounded1c',
                color: Color(0xff656565),
                fontWeight: FontWeight.w400,
                fontSize: 13),
          ),
        ),
        routes: {
          'splash': (context) => splashScreen(),
          'signIn': (context) => SignInScreen(),
          'onboardingScreen': (context) => OnboardingScreen(),
          'chooseToStart': (context) => StartSignUp(),
          'forgetPassword': (context) => ForgetPassword(),
          'EnableLocationaccess': (context) => EnableLocationaccess(),
          'VerificationSuccessful': (context) => VerificationSuccessful(),
          'resetPassword': (context) => ResetPassword(),
          'verifyCode': (context) => verifyCode(),
          'ScheduleRide': (context) => ScheduleRideScreen(),
          'NavBar': (context) => NavBar(),
          'rideBooking': (context) => RideBookingScreen(),
          'accountMenu': (context) => AccountMenu(),
          'PaymentPage': (context) => PaymentPage(),
          'paymentCard': (context) => PaymentPageCard(),
          'setting': (context) => SettingsScreen(),
          'notification': (context) => NotificationsScreen(),
          'homePassenger': (context) => MyHome(),
        });
  }
}
