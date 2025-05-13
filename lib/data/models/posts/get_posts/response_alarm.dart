import 'package:to_do_app/data/models/posts/get_posts/get_alarm.dart';

/// data : {"type":"reminder","title":"reminder title is here","description":"reminder description is here","alarm_date":"2025-01-20","alarm_time":"22:00","is_repeatable":"0","image":"uploads/alarms/1c4b11bd03014e0a85390b99a5320074.jpg","user_id":2,"updated_at":"2025-01-18T18:51:19.000000Z","created_at":"2025-01-18T18:51:19.000000Z","id":1}
/// status : 201
/// message : "Alarm Created Successfully!"

class PostAlarmResponse {
  PostAlarmResponse({
    this.data,
    this.status,
    this.message,
  });
  @override
  String toString() {
    // TODO: implement toString
    return 'PostAlarmResponse(data: $data, status: $status, message: $message)';
  }

  factory PostAlarmResponse.fromJson(dynamic json) {
    return PostAlarmResponse(
      data: json['data'] == null ? null : Alarms.fromJson(json['data']),
      status: json['status'],
      message: json['message'],
    );
  }
  Alarms? data;
  num? status;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['status'] = status;
    map['message'] = message;
    return map;
  }
}
