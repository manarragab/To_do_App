
class Posts {
  int? id;
  int? userId;
  String? title;
  String? body;

  Posts({this.id, this.userId, this.title, this.body});

  Posts.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    userId = json["user_id"];
    title = json["title"];
    body = json["body"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["user_id"] = userId;
    _data["title"] = title;
    _data["body"] = body;
    return _data;
  }
}