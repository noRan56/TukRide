import 'package:flutter/material.dart';
import 'package:tuk_ride/constant/MyColors.dart';

class HomeDriver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.myWhite,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/userAvater.png'),
            ),
            Container(
              decoration: BoxDecoration(color: MyColor.myWhite),
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Online',
                      style: TextStyle(color: MyColor.myBlack),
                    ),
                    Switch(
                        value: true,
                        onChanged: (bool newValue) {},
                        activeColor: MyColor.myYellow),
                  ],
                ),
              ),
            ),
            Stack(
              children: [
                IconButton(
                  icon: Image.asset(
                    'assets/images/notificationMap.png',
                    width: 40,
                    height: 40,
                  ),
                  onPressed: () {},
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: Text(
                    '1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
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
                  backgroundImage:
                      NetworkImage('https://via.placeholder.com/150'),
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
                    Image.asset(
                      'assets/images/ic_current.png',
                      width: 30,
                      height: 30,
                    ),
                    Container(
                      height: 20,
                      child: VerticalDivider(
                        color: Colors.grey,
                        thickness: 2,
                      ),
                    ),
                    Image.asset(
                      'assets/images/pin.png',
                      width: 30,
                      height: 30,
                    ),
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
