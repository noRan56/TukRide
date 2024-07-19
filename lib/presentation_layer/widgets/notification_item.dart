import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  final String title;
  final String message;
  final String time;
  final bool isNew;

  NotificationItem({
    required this.title,
    required this.message,
    required this.time,
    required this.isNew,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: isNew ? Color(0xffe9e9e9) : Color(0xfffdfdfd),
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Color(0xffc8c7cc),
            blurRadius: 5.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xfff9c32b),
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  message,
                  style: TextStyle(fontSize: 14, color: Color(0xff242424)),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Just now',
                  style: TextStyle(fontSize: 12, color: Color(0xffc8c7cc)),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text(
                time,
                style: TextStyle(fontSize: 14, color: Color(0xffc8c7cc)),
              ),
              if (isNew)
                Icon(Icons.circle, color: Color(0xfff9c32b), size: 12.0),
            ],
          ),
        ],
      ),
    );
  }
}
