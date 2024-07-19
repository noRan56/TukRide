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
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Color(0xfffdfdfd),
        elevation: 0,
        flexibleSpace: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                child: Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(Icons.arrow_back_ios_new_outlined,
                            color: Color(0xff242424)),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(0),
                          backgroundColor: Color(0xfff9c32b),
                        )))),
            Column(children: [
              Container(
                child: const Text('Notifications',
                    style: TextStyle(
                        color: Color(0xff242424),
                        fontWeight: FontWeight.bold,
                        fontSize: 40)),
              ),
              Container(
                  height: 5,
                  width: 300,
                  decoration: const BoxDecoration(
                      color: Color(0xfff9c32b),
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ])
          ],
        ),
      ),
      body: ListView.builder(
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
    );
  }
}
