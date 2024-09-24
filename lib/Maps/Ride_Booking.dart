import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:tuk_ride/core/constant/MyColors.dart';

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
            color: MyColor.myYellow,
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
              img: Image.asset('assets/images/icon-close-alt.png')),
        ],
      ),
    );
  }
}

class LocationRow extends StatelessWidget {
  final String label;
  final String location;
  final Widget icon;
  final Widget? img;

  const LocationRow({
    required this.label,
    required this.location,
    required this.icon,
    this.img,
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
            SizedBox(width: 80),
          ],
        ),
        if (img != null) SizedBox(width: 10),
        if (img != null) img!,
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
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 250,
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Searching for drivers',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 10.0),
              Text(
                'Currently for the drivers closest to you, Please wait o few munutes...',
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 20.0),
              LinearProgressIndicator(
                color: MyColor.myYellow,
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel Search'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColor.myYellow,
                  foregroundColor: MyColor.myBlack,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

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
        _showBottomSheet(context);
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
              Navigator.of(context).pushNamed('ConfirmRide');
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
