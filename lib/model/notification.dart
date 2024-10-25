class NotificationsModel {
  final String image;
  final String description;
  final String date;

  NotificationsModel({
    required this.image,
    required this.description,
    required this.date,
  });

  NotificationsModel.fromJson(Map<String, dynamic> json):
        image = json['image'] as String,
        description = json['description'] as String,
        date = json['date'] as String;

}

