import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mymap extends StatelessWidget {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  static const CameraPosition _kshibenKom = CameraPosition(
    target: LatLng(30.55283, 31.00493),
    zoom: 14.4746,
  );
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _kshibenKom,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      zoomControlsEnabled: false,
      compassEnabled: false,
    );
  }
}
