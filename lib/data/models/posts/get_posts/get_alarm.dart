
class Alarm {
  List<Alarms>? data;
  int? status;
  String? message;

  /// The status code of the response

  Alarm({this.data, this.status, this.message});
@override
  String toString() {
    // TODO: implement toString
    return 'Alarm(data: $data, status: $status, message: $message)';
  }
  Alarm.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : (json["data"] as List).map((e) => Alarms.fromJson(e)).toList();
    status = json["status"];
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    _data["status"] = status;
    _data["message"] = message;
    return _data;
  }
}

class Alarms {
  int? id;
  int? userId;
  String? type;
  String? title;
  String? description;
  dynamic alarmDate;
  dynamic alarmTime;
  int? isRepeatable;
  String? medicineStartDate;
  String? medicineEndDate;
  String? image;
  int? isTriggered;
  String? createdAt;
  String? updatedAt;
  String? imagePath;

  Alarms({this.id, this.userId, this.type, this.title, this.description, this.alarmDate, this.alarmTime, this.isRepeatable, this.medicineStartDate, this.medicineEndDate, this.image, this.isTriggered, this.createdAt, this.updatedAt, this.imagePath});
  @override
  String toString() {
    return 'Alarms(id: $id, userId: $userId, type: $type, title: $title, description: $description, alarmDate: $alarmDate, alarmTime: $alarmTime, isRepeatable: $isRepeatable, medicineStartDate: $medicineStartDate, medicineEndDate: $medicineEndDate, image: $image, isTriggered: $isTriggered, createdAt: $createdAt, updatedAt: $updatedAt, imagePath: $imagePath)';
  }
  Alarms.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    userId = json["user_id"];
    type = json["type"];
    title = json["title"];
    description = json["description"];
    alarmDate = json["alarm_date"];
    alarmTime = json["alarm_time"];
    isRepeatable = json["is_repeatable"];
    medicineStartDate = json["medicine_start_date"];
    medicineEndDate = json["medicine_end_date"];
    image = json["image"];
    isTriggered = json["is_triggered"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    imagePath = json["image_path"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["user_id"] = userId;
    _data["type"] = type;
    _data["title"] = title;
    _data["description"] = description;
    _data["alarm_date"] = alarmDate;
    _data["alarm_time"] = alarmTime;
    _data["is_repeatable"] = isRepeatable;
    _data["medicine_start_date"] = medicineStartDate;
    _data["medicine_end_date"] = medicineEndDate;
    _data["image"] = image;
    _data["is_triggered"] = isTriggered;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["image_path"] = imagePath;
    return _data;
  }
}