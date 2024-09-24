import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tuk_ride/core/helpers/get_location.dart';

class Locator extends StatefulWidget {
  Locator({super.key});

  @override
  State<Locator> createState() => _LocatorState();
}

class _LocatorState extends State<Locator> {
  static Position? position;

  Future<void> getMyCurrentLocation() async {
    position = await Location.determineCurrentLocation().whenComplete(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
