import 'package:tuk_ride/OTP/onboarding_info.dart';

class OnboardingItems {
  List<OnboardingInfo> items = [
    OnboardingInfo(
      logo: "assets/images/TUK.svg",
      image: "assets/images/Page 1.png",
      title: "Request Ride",
      descriptions: 'Request a ride get picked up by a nearby community driver',
    ),
    OnboardingInfo(
        logo: "assets/images/TUK.svg",
        image: "assets/images/Page 2.png",
        title: "Confirm Your Driver",
        descriptions:
            "Huge drivers network helps you find comfortable, safe and cheap ride"),
    OnboardingInfo(
      logo: "assets/images/TUK.svg",
      image: "assets/images/Page3.png",
      title: "Track Your Ride",
      descriptions:
          'Know your driver in advance and be able to view current location in real time on the map',
    )
  ];
}
