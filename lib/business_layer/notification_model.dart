class NotificationModel {
  final String title;
  final String message;
  final String time;
  final bool isNew;

  NotificationModel({
    required this.title,
    required this.message,
    required this.time,
    required this.isNew,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      title: json['title'],
      message: json['message'],
      time: json['time'],
      isNew: json['isNew'],
    );
  }
}
