class MessageModel {
  String? message;
  String? userName;
  String? image;
  String? time;
  bool? isActive;
  String? id;

  MessageModel({
    this.message,
    this.userName,
    this.image,
    this.time,
    this.isActive,
    this.id,
  });

  MessageModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    userName = json['userName'];
    image = json['image'];
    time = json['time'];
    isActive = json['isActive'];
    id = json['id'];
  }
}
