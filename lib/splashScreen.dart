// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:tuk_ride/OTP/OTP-Pages.dart';

// class splashScreen extends StatefulWidget {
//   //
//   const splashScreen({super.key});

//   @override
//   State<splashScreen> createState() => _splashScreenState();
// }

// class _splashScreenState extends State<splashScreen> {
//   //   with SingleTickerProviderStateMixin {
//   // late final AnimationController _controller;
//   bool loading = true;
//   @override
//   void initState() async {
//     //   // _controller =
//     //   //     AnimationController(vsync: this, duration: Durations.extralong4);
//     //   // _controller.forward();

//     //   // // Navigate after animation completes
//     //   // _controller.addStatusListener((status) {
//     //   //   if (status == AnimationStatus.completed) {
//     //   //     Navigator.of(context).pushReplacementNamed('onboardingScreen');
//     //   //   }
//     //   // });

//     await Future.delayed(Duration(seconds: 1), () {
//       Navigator.of(context).pushReplacementNamed('onboardingScreen');
//     });
//     super.initState();
//     loading = false;
//     setState(() {});
//   }

//   // @override
//   // void dispose() {
//   //   _controller.dispose();

//   //   super.dispose();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _buildUI(),
//     );
//   }

//   Widget _buildUI() {
//     return Center(
//       child: Lottie.asset(
//         'assets/splash/splash.json',
//         width: MediaQuery.sizeOf(context).width,
//         height: MediaQuery.sizeOf(context).height,
//         fit: BoxFit.cover,
//         // controller: _controller,
//       ),
//     );
//     // setState(() {
//     //   Timer(Duration(seconds: 2), () {
//     //     Navigator.of(context).pushReplacementNamed('onboardingScreen');
//     //   });
//     // });
//   }
// }

// // class splashScreen extends StatelessWidget {
// //   const splashScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return AnimatedSplashScreen(
// //       splash: Center(
// //         child: Lottie.asset('assets/splash/splash.json'),
// //       ),
// //       nextScreen: OnboardingScreen(),
// //       duration: 3000,
// //       splashIconSize: 200,
// //     );
// //   }
// // }

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tuk_ride/OTP/OTP-Pages.dart'; // Make sure this path is correct

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToOnboarding();
  }

  void _navigateToOnboarding() async {
    await Future.delayed(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/splash/splash.json',
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
