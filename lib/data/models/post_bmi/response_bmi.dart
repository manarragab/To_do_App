
class ResponseBmi {
  BMI? data;
  int? status;
  String? message;

  ResponseBmi({this.data, this.status, this.message});

  ResponseBmi.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : BMI.fromJson(json["data"]);
    status = json["status"];
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    _data["status"] = status;
    _data["message"] = message;
    return _data;
  }
}

class BMI {
  String? score;
  String? category;
  String? comment;

  BMI({this.score, this.category, this.comment});

  BMI.fromJson(Map<String, dynamic> json) {
    score = json["score"];
    category = json["category"];
    comment = json["comment"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["score"] = score;
    _data["category"] = category;
    _data["comment"] = comment;
    return _data;
  }
}