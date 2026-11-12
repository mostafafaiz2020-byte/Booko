class SliderModels {
  Data? data;
  String? message;
  int? status;

  SliderModels({this.data, this.message, this.status});

  SliderModels.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
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

class Data {
  List<Sliders>? sliders;

  Data({this.sliders});

  Data.fromJson(Map<String, dynamic> json) {
    sliders = json["sliders"] == null
        ? null
        : (json["sliders"] as List).map((e) => Sliders.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (sliders != null) {
      _data["sliders"] = sliders?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Sliders {
  String? image;

  Sliders({this.image});

  Sliders.fromJson(Map<String, dynamic> json) {
    image = json["image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["image"] = image;
    return _data;
  }
}
