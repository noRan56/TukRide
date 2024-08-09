import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import 'package:http/http.dart' as http;

import 'package:tuk_ride/constant/MyColors.dart';
import 'package:tuk_ride/helpers/get_location.dart';
import 'package:tuk_ride/helpers/search_loactin_osm.dart';

class DrivingToDistance extends StatefulWidget {
  const DrivingToDistance({super.key});

  @override
  State<DrivingToDistance> createState() => _DrivingToDistanceState();
}

class _DrivingToDistanceState extends State<DrivingToDistance> {
  FloatingSearchBarController controller = FloatingSearchBarController();
  Completer<GoogleMapController> _mapController = Completer();
  static Position? position;
  List<LatLng> polylineCoordinates = [];
  Set<Polyline> polylines = {};
  Set<Marker> markers = {};

  BitmapDescriptor? startMarkerIcon;
  BitmapDescriptor? endMarkerIcon;

  static final CameraPosition _myCurrentLocationCameraPosition = CameraPosition(
      bearing: 0.0,
      target: LatLng(position?.latitude ?? 0.0, position?.longitude ?? 0.0),
      tilt: 0.0,
      zoom: 17);

  Future<void> getMyCurrentLocation() async {
    position = await Location.determineCurrentLocation().whenComplete(() {
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    getMyCurrentLocation();
    _loadMarkerIcons();
  }

  Future<void> _loadMarkerIcons() async {
    startMarkerIcon = await BitmapDescriptor.asset(
      ImageConfiguration(size: Size(48, 48)),
      'assets/pin.png',
    );
    endMarkerIcon = await BitmapDescriptor.asset(
      ImageConfiguration(size: Size(48, 48)),
      'assets/ic_Pin.png',
    );
  }

  final NominatimService _nominatimService = NominatimService();
  List<Map<String, dynamic>> _suggestions = [];

  Widget buildMap() {
    return GoogleMap(
      mapType: MapType.normal,
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      initialCameraPosition: _myCurrentLocationCameraPosition,
      polylines: polylines,
      markers: markers,
      onMapCreated: (GoogleMapController controller) {
        _mapController.complete(controller);
      },
      onTap: _onMapTap,
    );
  }

  Future<void> _goToMyCurrentLocation() async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(
        CameraUpdate.newCameraPosition(_myCurrentLocationCameraPosition));
  }

  Future<void> _goToPlace(double lat, double lon) async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: LatLng(lat, lon),
        zoom: 17,
      ),
    ));
  }

  Future<void> _getRoute(LatLng start, LatLng end) async {
    final response = await http.get(
      Uri.parse(
          'http://router.project-osrm.org/route/v1/driving/${start.longitude},${start.latitude};${end.longitude},${end.latitude}?overview=full&geometries=geojson'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final geometry = data['routes'][0]['geometry'];
      final List<dynamic> coordinates = geometry['coordinates'];

      setState(() {
        polylineCoordinates.clear();
        for (var coordinate in coordinates) {
          polylineCoordinates.add(LatLng(coordinate[1], coordinate[0]));
        }
        polylines.add(Polyline(
          polylineId: PolylineId('route'),
          points: polylineCoordinates,
          color: const Color.fromARGB(255, 2, 2, 2),
          width: 5,
        ));

        // Add markers at the start and end of the polyline
        markers.add(Marker(
          markerId: MarkerId('start'),
          position: start,
          icon: startMarkerIcon ??
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        ));

        markers.add(Marker(
          markerId: MarkerId('end'),
          position: end,
          icon: endMarkerIcon ??
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        ));
      });

      // Calculate and display the distance
      double distanceInMeters = Geolocator.distanceBetween(
          start.latitude, start.longitude, end.latitude, end.longitude);
      double distanceInKilometers = distanceInMeters / 1000;

      double timeInHours = distanceInKilometers / 2;
      double timeInMinutes = timeInHours * 60;

      _showDistanceBottomSheet(distanceInKilometers, timeInMinutes);
    } else {
      throw Exception('Failed to load route');
    }
  }

  void _onMapTap(LatLng tappedPoint) async {
    if (position != null) {
      final start = LatLng(position!.latitude, position!.longitude);
      await _getRoute(start, tappedPoint);
      await _goToPlace(tappedPoint.latitude, tappedPoint.longitude);
    }
  }

  void _showDistanceBottomSheet(double distance, double time) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  height: 5,
                  width: 70,
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
              SizedBox(
                height: 20,
              ),
              Text(
                'Driving to Destination ...',
                style: TextStyle(fontSize: 16, color: MyColor.myBlack),
                textAlign: TextAlign.start,
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/userAvater.png'),
                ),
                title: Text('Ahmed'),
                // subtitle: Row(
                //   children: [
                //     Icon(Icons.star, color: Colors.yellow, size: 16.0),
                //     Icon(Icons.star, color: Colors.yellow, size: 16.0),
                //     Icon(Icons.star, color: Colors.yellow, size: 16.0),
                //     Icon(Icons.star, color: Colors.yellow, size: 16.0),
                //     Icon(Icons.star_border, color: Colors.yellow, size: 16.0),
                //   ],
                // ),
              ),
              Divider(
                color: MyColor.myLineColor,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text('Arrival in', style: TextStyle(color: Colors.grey)),
                      SizedBox(height: 5),
                      Text('${time.toStringAsFixed(0)} min'),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Distance', style: TextStyle(color: Colors.grey)),
                      SizedBox(height: 5),
                      Text('${distance.toStringAsFixed(2)} km'),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Fare', style: TextStyle(color: Colors.grey)),
                      SizedBox(height: 5),
                      Text('40\$'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('feedback');
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      backgroundColor: const Color(0xfff9c32b),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100, vertical: 20),
                    ),
                    child: Text(
                      'Change Destination',
                      style: TextStyle(color: MyColor.myBlack),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('NavBar');
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 150, vertical: 20),
                    ),
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: MyColor.myBlack),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildFloatingSearchBar() {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return FloatingSearchBar(
      controller: controller,
      elevation: 6,
      hintStyle: TextStyle(fontSize: 18),
      queryStyle: TextStyle(fontSize: 18),
      hint: '   Find a place',
      borderRadius: BorderRadius.circular(20),
      margins: EdgeInsets.fromLTRB(20, 70, 20, 0),
      padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
      height: 52,
      iconColor: MyColor.myGrey,
      scrollPadding: EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: Duration(milliseconds: 600),
      transitionCurve: Curves.easeInOut,
      physics: BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 600 : 500,
      debounceDelay: Duration(milliseconds: 500),
      onQueryChanged: (query) async {
        if (query.length >= 3) {
          final suggestions = await _nominatimService.searchPlaces(query);
          setState(() {
            _suggestions = suggestions;
          });
        } else {
          setState(() {
            _suggestions = [];
          });
        }
      },
      onFocusChanged: (_) {},
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
              icon: Icon(Icons.place,
                  color: const Color.fromARGB(255, 222, 236, 241)),
              onPressed: () {}),
        )
      ],
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: Colors.white,
            elevation: 4.0,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _suggestions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_suggestions[index]['display_name']),
                  onTap: () {
                    final lat = _suggestions[index]['lat'];
                    final lon = _suggestions[index]['lon'];
                    _goToPlace(lat, lon);
                    controller.close();
                    _getRoute(
                      LatLng(position?.latitude ?? 0.0,
                          position?.longitude ?? 0.0),
                      LatLng(lat, lon),
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          position != null
              ? buildMap()
              : Center(
                  child: CircularProgressIndicator(color: MyColor.myYellow),
                ),
          buildFloatingSearchBar(),
        ],
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 8, 30),
        child: FloatingActionButton(
            backgroundColor: MyColor.myWhite,
            onPressed: _goToMyCurrentLocation,
            child: Icon(
              Icons.place,
              color: MyColor.myWhite,
            )),
      ),
    );
  }
}
