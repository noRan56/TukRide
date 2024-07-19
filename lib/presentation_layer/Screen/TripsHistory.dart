import 'package:flutter/material.dart';
import 'package:tuk_ride/data_layer/trip_data.dart';

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
      body: Column(
        children: [
          AppBar(
            toolbarHeight: 120,
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            elevation: 0,
            title: Column(
              children: [
                Text(
                  'Trips History',
                  style: TextStyle(color: Color(0xff242424)),
                ),
                Container(
                    height: 5,
                    width: 150,
                    decoration: const BoxDecoration(
                        color: Color(0xfff9c32b),
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                SizedBox(height: 20.0),
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
                        color: Color(0xfff9c32b),
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
              ],
            ),
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
                Text(trips[index].address),
                Row(
                  children: [
                    Icon(Icons.calendar_today, size: 14, color: Colors.grey),
                    SizedBox(width: 5),
                    Text(trips[index].date),
                    SizedBox(width: 10),
                    Icon(Icons.access_time, size: 14, color: Colors.grey),
                    SizedBox(width: 5),
                    Text(trips[index].time),
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
                                    color: Color(0xfff9c32b),
                                    decoration: TextDecoration.underline,
                                    decorationColor: Color(0xfff9c32b),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  size: 14,
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
            trailing: Image.network(
              trips[index].imageUrl,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
            isThreeLine: true,
            dense: true,
            onTap: () {},
          ),
        );
      },
    );
  }
}
