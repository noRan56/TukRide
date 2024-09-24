import 'package:flutter/material.dart';
import 'package:tuk_ride/core/helpers/reviews_section.dart';

class DriverDetailsPage extends StatelessWidget {
  final List<Map<String, dynamic>> reviews = [
    {
      'name': 'Abdo Kanoon ',
      'rating': 4,
      'comment': 'The journey was really smooth. He is also very respectful.'
    },
    {
      'name': 'Nouran Yasser',
      'rating': 3,
      'comment': 'The journey was really smooth. He is also very respectful.'
    },
    {
      'name': 'Mohamed Abdelaziz',
      'rating': 5,
      'comment': 'The journey was really smooth. He is also very respectful.'
    },
    {
      'name': 'israa Ahmed',
      'rating': 2,
      'comment': 'The journey was really smooth. He is also very respectful.'
    },
    {
      'name': 'Dina Mohamed',
      'rating': 4,
      'comment': 'The journey was really smooth. He is also very respectful.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final firstReview =
        reviews.isNotEmpty ? reviews[0] : {'name': 'No Reviews', 'rating': 0};

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('NavBar');
                    },
                    child: Image.asset(
                      'assets/images/back.png',
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Driver\'s Details',
                        style: TextStyle(
                            color: Color(0xff242424),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Container(
                        height: 5,
                        width: 100,
                        decoration: const BoxDecoration(
                            color: Color(0xfff9c32b),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 20.0),
            Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/userAvater.png'),
                ),
                SizedBox(height: 20.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Ahmed Gamal',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        return Image.asset(
                          index < firstReview['rating']
                              ? 'assets/images/Shape.png'
                              : 'assets/images/star black border .png',
                          height: 20,
                          color: Color(0xfff9c32b),
                        );
                      }),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('chat');
                    },
                    child: Image.asset(
                      'assets/images/chat.png',
                      height: 40,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 2,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(),
                  child: TextButton(
                    onPressed: () {},
                    child: Image.asset(
                      'assets/images/call.png',
                      height: 40,
                    ),
                  ),
                ),
              ),
            ]),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text('5'),
                    Text('Trips Token'),
                  ],
                ),
                Column(
                  children: [
                    Text('3.6'),
                    Text('Rating'),
                  ],
                ),
                Column(
                  children: [
                    Text('2'),
                    Text('Years of Experience'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ReviewsSection(reviews: reviews),
            ),
          ],
        ),
      ),
    );
  }
}
