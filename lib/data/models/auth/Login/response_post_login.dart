
class ResponsePostLogin {
  String? id;
  String? accessToken;
  String? refreshToken;

  ResponsePostLogin({this.id, this.accessToken, this.refreshToken});

  ResponsePostLogin.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    accessToken = json["access_token"];
    refreshToken = json["refresh_token"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["access_token"] = accessToken;
    _data["refresh_token"] = refreshToken;
    return _data;
  }
}