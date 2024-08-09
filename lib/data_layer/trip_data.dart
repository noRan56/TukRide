import 'package:flutter/material.dart';

class Trip {
  final String title;
  final String address;
  final String date;
  final String time;
  final String image;

  Trip({
    required this.title,
    required this.address,
    required this.date,
    required this.time,
    required this.image,
  });
}

List<Trip> completedTrips = [
  Trip(
    title: 'Mohamed street',
    address: '10, Mohamed street, Shibin',
    date: '20 Feb, 2024',
    time: '3:00 PM',
    image: 'assets/images/8vt95s35.png',
  ),
  Trip(
    title: 'Mohamed street',
    address: '10, Mohamed street, Shibin',
    date: '20 Feb, 2024',
    time: '3:00 PM',
    image: 'assets/images/8vt95s35.png',
  ),
];

List<Trip> upcomingTrips = [
  Trip(
    title: ' street',
    address: '15,  street, Shibin',
    date: '25 may, 2024',
    time: '5:00 PM',
    image: 'assets/images/8vt95s35.png',
  ),
  Trip(
    title: 'Upcoming street',
    address: '15, Upcoming street, Shibin',
    date: '25 Feb, 2024',
    time: '5:00 PM',
    image: 'assets/images/8vt95s35.png',
  ),
  Trip(
    title: 'Upcoming street',
    address: '15, Upcoming street, Shibin',
    date: '25 Feb, 2024',
    time: '5:00 PM',
    image: 'assets/images/8vt95s35.png',
  ),
  Trip(
    title: 'Upcoming street',
    address: '15, Upcoming street, Shibin',
    date: '25 Feb, 2024',
    time: '5:00 PM',
    image: 'assets/images/8vt95s35.png',
  ),
];
