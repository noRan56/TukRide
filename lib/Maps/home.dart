import 'dart:async';
import 'dart:ui' as ui;
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tuk_ride/NavBar/NavBar.dart';

import 'package:tuk_ride/core/helpers/api_url.dart';
import 'package:tuk_ride/shared_pref_helper.dart';
import '../Passenger/search_bar.dart' as custom;

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  final TextEditingController _searchController = TextEditingController();

  static const CameraPosition _kshibenKom = CameraPosition(
    target: LatLng(30.55283, 31.00493),
    zoom: 14.4746,
  );
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  Uint8List? marketimages;
  final List<Marker> _markers = <Marker>[];
  final List<String> myMarker = [
    'assets/images/marker.png',
    'assets/images/marker.png',
    'assets/images/marker.png',
    'assets/images/marker.png',
    'assets/images/marker.png',
    'assets/images/marker.png',
    'assets/images/marker.png',
    'assets/images/marker.png',
    'assets/images/marker.png',
    'assets/images/marker.png',
    'assets/images/marker.png',
    'assets/images/marker.png',
  ];

  final List<LatLng> _latLen = <LatLng>[
    LatLng(30.543065, 31.007868),
    LatLng(30.574525, 31.007448),
    LatLng(30.555087, 30.998436),
    LatLng(30.552811, 31.008443),
    LatLng(30.553915, 31.006333),
    LatLng(30.550620, 31.008112),
    LatLng(30.555542, 31.005864),
    LatLng(30.554784, 31.005285),
    LatLng(30.555209, 31.011121),
    LatLng(30.549407, 31.018031),
    LatLng(30.556314, 31.021861),
    LatLng(30.553733, 31.014117),
  ];

  Future<Uint8List> getImages(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  Future<void> _avaliableRide() async {
    var request = await http.Request(
        'GET',
        Uri.parse(
            '${UrlApi.url}/user/availableRides?location=30.555087, 30.998436'));

    request.headers['Content-Type'] = 'application/json';
    request.headers['Authorization'] =
        'Bearer ' + await SharedPrefHelper.getData(key: 'token');

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  void initState() {
    super.initState();

    loadData();
    _avaliableRide();
  }

  loadData() async {
    for (int i = 0; i < myMarker.length; i++) {
      final Uint8List markIcons = await getImages(myMarker[i], 100);

      _markers.add(Marker(
        markerId: MarkerId(i.toString()),
        icon: BitmapDescriptor.fromBytes(markIcons),
        position: _latLen[i],
        infoWindow: InfoWindow(
          title: 'Location: ' + i.toString(),
        ),
      ));
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kshibenKom,
              markers: Set<Marker>.of(_markers),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              zoomControlsEnabled: false,
              compassEnabled: false,
            ),
            Positioned(
              top: 62,
              left: 20,
              right: 10,
              child: custom.SearchBar(
                controller: _searchController,
                onChanged: (value) {
                  print("Search query: $value");
                },
                onSubmitted: (query) {
                  print("Search initiated with query: $query");
                },
              ),
            ),
            Positioned(
              top: 120,
              left: 10,
              right: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 20,
                  ),
                  IconButton(
                    icon: Image.asset(
                      'assets/images/notificationMap.png',
                      width: 60,
                      height: 60,
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed('notification');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: Container(
          child: SizedBox(
            width: 24,
            height: 24,
            child: FloatingActionButton(
              child: Image.asset(
                'assets/images/ic_Location.png',
                fit: BoxFit.cover,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              backgroundColor: Colors.white,
              onPressed: () async {
                GoogleMapController controller = await _controller.future;
                controller.animateCamera(
                    CameraUpdate.newCameraPosition(CameraPosition(
                  target: LatLng(30.55283, 31.00493),
                  zoom: 14,
                )));
              },
            ),
          ),
        ),
      ),
    );
  }
}
