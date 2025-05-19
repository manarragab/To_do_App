
class PostRegister {
  String? phone;
  String? password;
  String? displayName;
  int? experienceYears;
  String? address;
  String? level;

  PostRegister({this.phone, this.password, this.displayName, this.experienceYears, this.address, this.level});

  PostRegister.fromJson(Map<String, dynamic> json) {
    phone = json["phone"];
    password = json["password"];
    displayName = json["displayName"];
    experienceYears = json["experienceYears"];
    address = json["address"];
    level = json["level"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["phone"] = phone;
    _data["password"] = password;
    _data["displayName"] = displayName;
    _data["experienceYears"] = experienceYears;
    _data["address"] = address;
    _data["level"] = level;
    return _data;
  }
}



Map<String,dynamic> RegisterJson={
    "phone" : "+201032970307",
    "password" : "1234567890",
    "displayName" : "manar ragab",
    "experienceYears" : 1,
    "address" : " tanta,Egypt",
    "level" : "junior"
};