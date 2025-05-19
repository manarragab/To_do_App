
class Tasks {
  String? id;
  String? image;
  String? title;
  String? desc;
  String? priority;
  String? status;
  String? user;
  String? createdAt;
  String? updatedAt;
  int? v;

  Tasks({this.id, this.image, this.title, this.desc, this.priority, this.status, this.user, this.createdAt, this.updatedAt, this.v});

  Tasks.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    image = json["image"];
    title = json["title"];
    desc = json["desc"];
    priority = json["priority"];
    status = json["status"];
    user = json["user"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    v = json["__v"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["image"] = image;
    _data["title"] = title;
    _data["desc"] = desc;
    _data["priority"] = priority;
    _data["status"] = status;
    _data["user"] = user;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["__v"] = v;
    return _data;
  }
}