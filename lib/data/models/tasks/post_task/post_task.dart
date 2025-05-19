
class PostTask {
  String? image;
  String? title;
  String? desc;
  String? priority;
  String? dueDate;

  PostTask({this.image, this.title, this.desc, this.priority, this.dueDate});

  PostTask.fromJson(Map<String, dynamic> json) {
    image = json["image"];
    title = json["title"];
    desc = json["desc"];
    priority = json["priority"];
    dueDate = json["dueDate"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["image"] = image;
    _data["title"] = title;
    _data["desc"] = desc;
    _data["priority"] = priority;
    _data["dueDate"] = dueDate;
    return _data;
  }
}