import 'package:flutter/material.dart';
import 'package:tuk_ride/constant/MyColors.dart';

class HomeDriver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/userAvater.png'),
            ),
            Container(
              decoration: BoxDecoration(color: MyColor.myGrey),
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Online',
                      style: TextStyle(color: Colors.black),
                    ),
                    Switch(
                      value: true,
                      onChanged: (bool newValue) {},
                      activeColor: Color(0xfff9c32B),
                    ),
                  ],
                ),
              ),
            ),
            Stack(
              children: [
                IconButton(
                  icon: Icon(Icons.notifications, color: Colors.black),
                  onPressed: () {},
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 12,
                      minHeight: 12,
                    ),
                    child: Text(
                      '1',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: RequestList(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
        selectedItemColor: Color(0xfff9c32B),
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

class RequestList extends StatelessWidget {
  final List<Request> requests = [
    Request(
      name: 'Aya Mohammed',
      price: 40,
      pickup: '10, Mohamed street, shibin',
      dropoff: 'Shibin El Kom',
    ),
    Request(
      name: 'Aya Mohammed',
      price: 40,
      pickup: '10, Mohamed street, shibin',
      dropoff: 'Shibin El Kom',
    ),
    Request(
      name: 'Aya Mohammed',
      price: 40,
      pickup: '10, Mohamed street, shibin',
      dropoff: 'Shibin El Kom',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: requests.length,
      itemBuilder: (context, index) {
        return RequestCard(request: requests[index]);
      },
    );
  }
}

class Request {
  final String name;
  final int price;
  final String pickup;
  final String dropoff;

  Request({
    required this.name,
    required this.price,
    required this.pickup,
    required this.dropoff,
  });
}

class RequestCard extends StatelessWidget {
  final Request request;

  RequestCard({required this.request});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://via.placeholder.com/150'), // ضع رابط صورة المستخدم هنا
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    request.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                Text(
                  '${request.price}\$',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
            Divider(),
            Row(
              children: [
                Column(
                  children: [
                    Icon(Icons.circle, color: Color(0xfff9c32B)),
                    Container(
                      height: 20,
                      child: VerticalDivider(
                        color: Colors.grey,
                        thickness: 2,
                      ),
                    ),
                    Icon(Icons.location_pin, color: Colors.black),
                  ],
                ),
                SizedBox(width: 8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'PICKUP',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.0,
                      ),
                    ),
                    Text(request.pickup),
                    SizedBox(height: 8.0),
                    Text(
                      'DROP-OFF',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.0,
                      ),
                    ),
                    Text(request.dropoff),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xfff9c32B),
                    foregroundColor: Colors.black,
                  ),
                  child: Text('Accept'),
                ),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black,
                    side: BorderSide(color: Color(0xfff9c32B)),
                  ),
                  child: Text('Ignore'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
