
import 'package:to_do_app/data/models/tasks/get_tasks/get_task.dart';

class ResponsePostTask {
  String? image;
  String? title;
  String? desc;
  String? priority;
  String? status;
  String? user;
  String? id;
  String? createdAt;
  String? updatedAt;
  int? v;

  ResponsePostTask({this.image, this.title, this.desc, this.priority, this.status, this.user, this.id, this.createdAt, this.updatedAt, this.v});

  ResponsePostTask.fromJson(Map<String, dynamic> json) {
    image = json["image"];
    title = json["title"];
    desc = json["desc"];
    priority = json["priority"];
    status = json["status"];
    user = json["user"];
    id = json["_id"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    v = json["__v"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["image"] = image;
    _data["title"] = title;
    _data["desc"] = desc;
    _data["priority"] = priority;
    _data["status"] = status;
    _data["user"] = user;
    _data["_id"] = id;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["__v"] = v;
    return _data;
  }

  
Tasks toTask() {
  return Tasks(
    id: id,
    image: image,
    title: title,
    desc: desc,
    priority: priority,
    status: status,
    user: user,
    createdAt: createdAt,
    updatedAt: updatedAt,
    v: v,
  );
}

}