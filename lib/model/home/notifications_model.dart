class NotificationsModel {
  int? notificaionId;
  int? userId;
  String? notificationImage;
  String? notificaionTitle;
  String? notificaionBody;

  NotificationsModel(
      {this.notificaionId,
      this.userId,
      this.notificationImage,
      this.notificaionTitle,
      this.notificaionBody});

  NotificationsModel.fromJson(Map<String, dynamic> json) {
    notificaionId = json['notificaion_id'];
    userId = json['user_id'];
    notificationImage = json["notificaion_image"];
    notificaionTitle = json['notificaion_title'];
    notificaionBody = json['notificaion_body'];
  }
}
