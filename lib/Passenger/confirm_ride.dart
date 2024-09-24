import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import 'package:http/http.dart' as http;
import 'package:tuk_ride/core/constant/MyColors.dart';
import 'package:tuk_ride/core/helpers/api_url.dart';
import 'package:tuk_ride/core/helpers/get_location.dart';
import 'package:tuk_ride/core/helpers/search_loactin_osm.dart';
import 'package:tuk_ride/shared_pref_helper.dart';

class ConfirmRide extends StatefulWidget {
  const ConfirmRide({super.key});

  @override
  State<ConfirmRide> createState() => _ConfirmRideState();
}

class _ConfirmRideState extends State<ConfirmRide> {
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
      'assets/images/Current_location.png',
    );
    endMarkerIcon = await BitmapDescriptor.asset(
      ImageConfiguration(size: Size(48, 48)),
      'assets/images/pin.png',
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

  Future<void> _bookRide() async {
    var request = http.Request('POST',
        Uri.parse('${UrlApi.url}/user/bookRide/66cfd595cf2b1aaea013d33a'));

    request.headers['Content-Type'] = 'application/json';
    request.headers['Authorization'] =
        'Bearer ' + await SharedPrefHelper.getData(key: 'token');
    request.body = json.encode({
      "endLocation": {
        "type": "Point",
        "coordinates": [31.2348, 30.0507]
      },
      "fare": 50
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
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

      _showBottomSheet(context);
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

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: MyColor.myWhite,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  alignment: Alignment.center,
                  height: 5,
                  width: 50,
                  decoration: const BoxDecoration(
                      color: MyColor.myGrey,
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 40,
                  ),
                  Image.asset(
                    'assets/images/8vt95s35.png',
                    width: 111,
                    height: 74,
                    alignment: Alignment.center,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('chat');
                        },
                        icon: Image.asset(
                          'assets/images/call.png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('chat');
                        },
                        icon: Image.asset(
                          'assets/images/chat.png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Container(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.3,
                ),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    ListTile(
                      leading: Image.asset(
                        'assets/images/userAvater.png',
                        height: 35,
                      ),
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FittedBox(
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamed('driverdetails');
                                    },
                                    child: Text(
                                      'Ahmed',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: MyColor.myBlack),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: List.generate(5, (index) {
                                    return Image.asset(
                                        index < 3
                                            ? ('assets/images/Shape.png')
                                            : ('assets/images/star black border .png'),
                                        height: 10,
                                        color: Color(0xfff9c32b));
                                  }),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('BYD • abc123'),
                          Text('5 min'),
                        ],
                      ),
                      trailing: Text('40\$'),
                    ),
                    Divider(
                      color: MyColor.myGrey,
                    ),
                    ListTile(
                      leading: IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/images/money.png',
                          width: 35,
                          height: 35,
                        ),
                      ),
                      title: Text('Pay Cash'),
                      trailing: IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('PaymentPage');
                        },
                        icon: Image.asset(
                          'assets/images/next.png',
                          width: 20,
                          height: 20,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: () {
                      _bookRide();
                      Navigator.of(context).pushReplacementNamed('feedback');
                    },
                    child: Text(
                      'Confirm',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                      backgroundColor: const Color(0xfff9c32b),
                    ),
                  ),
                  // SizedBox(width: 10),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('NavBar');
                    },
                    child: Text(
                      'Cancel',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      )),
                    ),
                  ),
                  SizedBox(width: 10),
                ],
              )
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
      iconColor: MyColor.myBlack,
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
          child: IconButton(
              icon: Image.asset(
                "assets/images/pin.png",
                width: 20,
              ),
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
      backgroundColor: MyColor.myWhite,
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
