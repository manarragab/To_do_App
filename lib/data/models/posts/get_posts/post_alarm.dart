import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';
/// image : "file"
/// type : "medicine"
/// title : "medicine title is here"
/// description : "medicine description is here"
/// medicine_start_date : "2025-01-20"
/// medicine_end_date : "2025-01-23"
/// is_repeatable : "1"

class PostAlarm {
  String? type;
  String? title;
  String? description;
  String? alarmDate;
  String? alarmTime;
  String? image;
  int? userId;
  String? updatedAt;
  String? createdAt;
  int? id;

  PostAlarm({this.type, this.title, this.description, this.alarmDate, this.alarmTime, this.image, this.userId, this.updatedAt, this.createdAt, this.id});

  PostAlarm.fromJson(Map<String, dynamic> json) {
    type = json["type"];
    title = json["title"];
    description = json["description"];
    alarmDate = json["alarm_date"];
    alarmTime = json["alarm_time"];
    image = json["image"];
    userId = json["user_id"];
    updatedAt = json["updated_at"];
    createdAt = json["created_at"];
    id = json["id"];
  }


//I converted it into Map already , from 10 minutes , but same error
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["type"] = type;
    _data["title"] = title;
    _data["description"] = description;
    _data["alarm_date"] = alarmDate;
    _data["alarm_time"] = alarmTime;
    _data["image"] = image;
    _data["user_id"] = userId;
    _data["updated_at"] = updatedAt;
    _data["created_at"] = createdAt;
    _data["id"] = id;
    return _data;
  }
}