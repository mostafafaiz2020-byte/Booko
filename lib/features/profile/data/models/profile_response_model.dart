class ProfileResponseModel {
  ProfileData? data;
  String? message;
  int? status;

  ProfileResponseModel({this.data, this.message, this.status});

  ProfileResponseModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : ProfileData.fromJson(json["data"]);
    message = json["message"];
    status = json["status"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    _data["message"] = message;

    _data["status"] = status;
    return _data;
  }
}

class ProfileData {
  int? id;
  String? name;
  String? email;
  dynamic address;
  dynamic city;
  dynamic phone;
  bool? emailVerified;
  String? image;

  ProfileData({
    this.id,
    this.name,
    this.email,
    this.address,
    this.city,
    this.phone,
    this.emailVerified,
    this.image,
  });

  ProfileData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    address = json["address"];
    city = json["city"];
    phone = json["phone"];
    emailVerified = json["email_verified"];
    image = json["image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["email"] = email;
    _data["address"] = address;
    _data["city"] = city;
    _data["phone"] = phone;
    _data["email_verified"] = emailVerified;
    _data["image"] = image;
    return _data;
  }
}
