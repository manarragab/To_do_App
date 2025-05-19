
class PostLogin {
  String? phone;
  String? password;

  PostLogin({this.phone, this.password});

  PostLogin.fromJson(Map<String, dynamic> json) {
    phone = json["phone"];
    password = json["password"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["phone"] = phone;
    _data["password"] = password;
    return _data;
  }
}




Map<String,dynamic> LoginJson={
  "phone" : "+201032970307",
  "password" : "1234567890"
};