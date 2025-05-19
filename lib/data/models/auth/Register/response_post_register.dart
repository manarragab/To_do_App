
class ResponsePostRegister {
  String? message;
  String? error;
  int? statusCode;

  ResponsePostRegister({this.message, this.error, this.statusCode});

  ResponsePostRegister.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    error = json["error"];
    statusCode = json["statusCode"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["message"] = message;
    _data["error"] = error;
    _data["statusCode"] = statusCode;
    return _data;
  }

  
}