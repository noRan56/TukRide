import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tuk_ride/constant/MyColors.dart';
import 'package:tuk_ride/data_layer/trip_data.dart';

import 'package:flutter_svg/flutter_svg.dart';

class TripsHistoryPage extends StatefulWidget {
  @override
  _TripsHistoryPageState createState() => _TripsHistoryPageState();
}

class _TripsHistoryPageState extends State<TripsHistoryPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.myWhite,
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            Text(
              'Trips History',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(height: 10.0),
            Container(
                height: 5,
                width: 150,
                decoration: const BoxDecoration(
                    color: Color(0xfff9c32b),
                    borderRadius: BorderRadius.all(Radius.circular(10)))),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _tabController.index = 0;
                    });
                  },
                  child: Text(
                    'Upcoming',
                    style: TextStyle(
                      color: _tabController.index == 0
                          ? Color(0xff242424)
                          : Color(0xffe9e9e9),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 5,
                  margin: EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: const BoxDecoration(
                    color: MyColor.myYellow,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _tabController.index = 1;
                    });
                  },
                  child: Text(
                    'Completed',
                    style: TextStyle(
                      color: _tabController.index == 1
                          ? Color(0xff242424)
                          : Color(0xffe9e9e9),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  buildTripList(context, upcomingTrips, showRebook: false),
                  buildTripList(context, completedTrips, showRebook: true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTripList(BuildContext context, List<Trip> trips,
      {required bool showRebook}) {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: trips.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.only(bottom: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.all(16.0),
            title: Text(trips[index].title),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  trips[index].address,
                  style: TextStyle(color: Color(0xffc8c7cc)),
                ),
                Row(
                  children: [
                    Image.asset('assets/images/calendar_icon.png',
                        height: 14, color: const Color(0xffc8c7cc)),
                    SizedBox(width: 5),
                    Text(trips[index].date,
                        style: TextStyle(color: Color(0xffc8c7cc))),
                    SizedBox(width: 10),
                    Image.asset('assets/images/clock_icon.png',
                        height: 14, color: Color(0xffc8c7cc)),
                    SizedBox(width: 5),
                    Text(trips[index].time,
                        style: TextStyle(color: Color(0xffc8c7cc))),
                  ],
                ),
                if (showRebook)
                  Column(
                    children: [
                      SizedBox(height: 8),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Rebook',
                                  style: TextStyle(
                                    color: MyColor.myYellow,
                                    decoration: TextDecoration.underline,
                                    decorationColor: MyColor.myYellow,
                                  ),
                                ),
                                Image.asset(
                                  'assets/images/next.png',
                                  height: 14,
                                  color: Color(0xfff9c32b),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
              ],
            ),
            trailing: Image.asset(trips[index].image,
                width: 60, height: 60, fit: BoxFit.cover),
            isThreeLine: true,
            dense: true,
            onTap: () {},
          ),
        );
      },
    );
  }
}
