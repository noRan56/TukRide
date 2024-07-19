import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tuk_ride/constant/MyColors.dart';

class RideBookingScreen extends StatelessWidget {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  static const CameraPosition _kshibenKom = CameraPosition(
    target: LatLng(30.55283, 31.00493),
    zoom: 14.4746,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.myWhite,
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kshibenKom,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            zoomControlsEnabled: false,
            compassEnabled: false,
          ),
          Positioned(
            top: 50,
            left: 16,
            right: 16,
            bottom: 0,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  UserProfileSection(),
                  SizedBox(height: 20),
                  LocationSection(),
                  SizedBox(height: 20),
                  AddressList(),
                  SizedBox(height: 80),
                  RideButtons()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UserProfileSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage('assets/images/userAvater.png'),
        ),
        Spacer(),
        IconButton(
          icon: Image.asset(
            'assets/images/notification.png',
            width: 24,
            height: 24,
            color: Colors.yellow,
          ),
          onPressed: () {
            // Notification button action
          },
        ),
      ],
    );
  }
}

class LocationSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LocationRow(
            label: 'PICK-UP',
            location: 'My current location',
            icon: Image.asset('assets/images/ic_current.png',
                width: 24, height: 24),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28.0),
            child: Divider(color: Colors.grey),
          ),
          LocationRow(
            label: 'DROP-OFF',
            location: 'Shibin El Kom',
            icon: Image.asset('assets/images/pin.png', width: 24, height: 24),
          ),
        ],
      ),
    );
  }
}

class LocationRow extends StatelessWidget {
  final String label;
  final String location;
  final Widget icon;

  const LocationRow({
    required this.label,
    required this.location,
    required this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style: TextStyle(
                    color: MyColor.myGrey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500)),
            Text(location),
          ],
        ),
      ],
    );
  }
}

class AddressList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          AddressItem(
            icon: Image.asset(
              'assets/images/homee.png',
              width: 40,
              height: 40,
            ),
            label: 'Home',
            address: '10, Mohamed Street, Shibin',
          ),
          Divider(color: MyColor.myLineColor),
          AddressItem(
            icon: Image.asset('assets/images/star.png', width: 40, height: 40),
            label: 'Saved locations',
            address: '10, Mohamed Street, Shibin ',
          ),
          Divider(color: MyColor.myLineColor),
          AddressItem(
            icon: Image.asset('assets/images/plus.png', width: 40, height: 40),
            label: 'New Address',
          ),
        ],
      ),
    );
  }
}

class AddressItem extends StatelessWidget {
  final String label;
  final String? address;
  final Widget icon;

  const AddressItem({
    required this.label,
    this.address,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(label),
      subtitle: address != null
          ? Text(
              address!,
              style: TextStyle(
                  color: MyColor.myGrey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            )
          : null,
      onTap: () {
        // Address item action
      },
    );
  }
}

class RideButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('ScheduleRide');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellow[700],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 14),
              width: double.infinity,
              alignment: Alignment.center,
              child: Text('Schedule Ride',
                  style: TextStyle(fontSize: 20, color: MyColor.myBlack)),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Book ride action
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellow[700],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 14),
              width: double.infinity,
              alignment: Alignment.center,
              child: Text('Book Ride',
                  style: TextStyle(fontSize: 20, color: MyColor.myBlack)),
            ),
          ),
        ],
      ),
    );
  }
}

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:tuk_ride/constant/MyColors.dart';

// class RideBookingScreen extends StatelessWidget {
//   final Completer<GoogleMapController> _controller =
//       Completer<GoogleMapController>();
//   static const CameraPosition _kshibenKom = CameraPosition(
//     target: LatLng(30.55283, 31.00493),
//     zoom: 14.4746,
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: MyColor.myWhite,
//       body: Stack(
//         children: [
//           GoogleMap(
//             mapType: MapType.normal,
//             initialCameraPosition: _kshibenKom,
//             onMapCreated: (GoogleMapController controller) {
//               _controller.complete(controller);
//             },
//             zoomControlsEnabled: false,
//             compassEnabled: false,
//           ),
//           Positioned(
//             top: 50,
//             left: 16,
//             right: 16,
//             bottom: 0,
//             child: Container(
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(12),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.3),
//                     spreadRadius: 2,
//                     blurRadius: 5,
//                     offset: Offset(0, 3),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   SizedBox(height: 10),
//                   UserProfileSection(),
//                   SizedBox(height: 20),
//                   LocationSection(),
//                   SizedBox(height: 20),
//                   AddressList(),
//                   SizedBox(height: 80),
//                   RideButtons(),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class UserProfileSection extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         CircleAvatar(
//           radius: 25,
//           backgroundImage: AssetImage('assets/images/userAvater.png'),
//         ),
//         Spacer(),
//         IconButton(
//           icon: Image.asset(
//             'assets/images/notification.png',
//             width: 24,
//             height: 24,
//             color: Colors.yellow,
//           ),
//           onPressed: () {
//             // Notification button action
//           },
//         ),
//       ],
//     );
//   }
// }

// class LocationSection extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.3),
//             spreadRadius: 2,
//             blurRadius: 5,
//             offset: Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           LocationRow(
//             label: 'PICK-UP',
//             location: 'My current location',
//             icon: Image.asset('assets/images/ic_current.png',
//                 width: 24, height: 24),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 28.0),
//             child: Divider(color: Colors.grey),
//           ),
//           LocationRow(
//             label: 'DROP-OFF',
//             location: 'Shibin El Kom',
//             icon: Image.asset('assets/images/pin.png', width: 24, height: 24),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class LocationRow extends StatelessWidget {
//   final String label;
//   final String location;
//   final Widget icon;

//   const LocationRow({
//     required this.label,
//     required this.location,
//     required this.icon,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         icon,
//         SizedBox(width: 10),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(label,
//                 style: TextStyle(
//                     color: MyColor.myGrey,
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500)),
//             Text(location),
//           ],
//         ),
//       ],
//     );
//   }
// }

// class AddressList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.3),
//             spreadRadius: 2,
//             blurRadius: 5,
//             offset: Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           AddressItem(
//             icon: Image.asset('assets/images/homee.png', width: 40, height: 40),
//             label: 'Home',
//             address: '10, Mohamed Street, Shibin',
//           ),
//           Divider(color: MyColor.myLineColor),
//           AddressItem(
//             icon: Image.asset('assets/images/star.png', width: 40, height: 40),
//             label: 'Saved locations',
//             address: '10, Mohamed Street, Shibin ',
//           ),
//           Divider(color: MyColor.myLineColor),
//           AddressItem(
//             icon: Image.asset('assets/images/plus.png', width: 40, height: 40),
//             label: 'New Address',
//           ),
//         ],
//       ),
//     );
//   }
// }

// class AddressItem extends StatelessWidget {
//   final String label;
//   final String? address;
//   final Widget icon;

//   const AddressItem({
//     required this.label,
//     this.address,
//     required this.icon,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: icon,
//       title: Text(label),
//       subtitle: address != null
//           ? Text(
//               address!,
//               style: TextStyle(
//                   color: MyColor.myGrey,
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500),
//             )
//           : null,
//       onTap: () {
//         // Address item action
//       },
//     );
//   }
// }

// class RideButtons extends StatelessWidget {
//   void _showBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       builder: (BuildContext context) {
//         return DraggableScrollableSheet(
//           initialChildSize: 0.8,
//           maxChildSize: 0.95,
//           minChildSize: 0.4,
//           builder: (BuildContext context, ScrollController scrollController) {
//             return Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(20),
//                   topRight: Radius.circular(20),
//                 ),
//               ),
//               child: ListView(
//                 controller: scrollController,
//                 children: [
//                   UserProfileSection(),
//                   SizedBox(height: 20),
//                   LocationSection(),
//                   SizedBox(height: 20),
//                   AddressList(),
//                   SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: () {
//                       // Schedule ride action
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.yellow[700],
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(100),
//                       ),
//                     ),
//                     child: Container(
//                       padding: EdgeInsets.symmetric(vertical: 14),
//                       width: double.infinity,
//                       alignment: Alignment.center,
//                       child: Text('Schedule Ride',
//                           style:
//                               TextStyle(fontSize: 20, color: MyColor.myBlack)),
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   ElevatedButton(
//                     onPressed: () {
//                       // Book ride action
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.yellow[700],
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(100),
//                       ),
//                     ),
//                     child: Container(
//                       padding: EdgeInsets.symmetric(vertical: 14),
//                       width: double.infinity,
//                       alignment: Alignment.center,
//                       child: Text('Book Ride',
//                           style:
//                               TextStyle(fontSize: 20, color: MyColor.myBlack)),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           ElevatedButton(
//             onPressed: () {
//               _showBottomSheet(context);
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.yellow[700],
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(100),
//               ),
//             ),
//             child: Container(
//               padding: EdgeInsets.symmetric(vertical: 14),
//               width: double.infinity,
//               alignment: Alignment.center,
//               child: Text('Schedule Ride',
//                   style: TextStyle(fontSize: 20, color: MyColor.myBlack)),
//             ),
//           ),
//           SizedBox(height: 10),
//           ElevatedButton(
//             onPressed: () {
//               // Book ride action
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.yellow[700],
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(100),
//               ),
//             ),
//             child: Container(
//               padding: EdgeInsets.symmetric(vertical: 14),
//               width: double.infinity,
//               alignment: Alignment.center,
//               child: Text('Book Ride',
//                   style: TextStyle(fontSize: 20, color: MyColor.myBlack)),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
