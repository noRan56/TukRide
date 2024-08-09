import 'package:flutter/material.dart';
import 'package:tuk_ride/business_layer/notification_model.dart';
import 'package:tuk_ride/data_layer/notification_data.dart';
import 'package:tuk_ride/presentation_layer/widgets/notification_item.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final notifications = NotificationData.getNotifications()
        .map((data) => NotificationModel.fromJson(data))
        .toList();

    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Image.asset(
                      'assets/images/back.png',
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Column(
                  children: [
                    Container(
                      child: const Text(
                        'Notifications',
                        style: TextStyle(
                          color: Color(0xff242424),
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ),
                    Container(
                      height: 5,
                      width: 130,
                      decoration: const BoxDecoration(
                        color: Color(0xfff9c32b),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return NotificationItem(
                  title: notification.title,
                  message: notification.message,
                  time: notification.time,
                  isNew: notification.isNew,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
