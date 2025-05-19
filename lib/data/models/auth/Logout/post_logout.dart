
class PostLogout {
  String? token;

  PostLogout({this.token});

  PostLogout.fromJson(Map<String, dynamic> json) {
    token = json["token"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["token"] = token;
    return _data;
  }
}