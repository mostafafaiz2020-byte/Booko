class BookDetailsModels {
  Data? data;
  String? message;
  List<dynamic>? error;
  int? status;

  BookDetailsModels({this.data, this.message, this.error, this.status});

  BookDetailsModels.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
    message = json["message"];
    error = json["error"] ?? [];
    status = json["status"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    _data["message"] = message;
    if (error != null) {
      _data["error"] = error;
    }
    _data["status"] = status;
    return _data;
  }
}

class Data {
  int? id;
  String? name;
  String? description;
  int? stock;
  int? bestSeller;
  String? price;
  int? discount;
  double? priceAfterDiscount;
  String? image;
  String? category;

  Data({
    this.id,
    this.name,
    this.description,
    this.stock,
    this.bestSeller,
    this.price,
    this.discount,
    this.priceAfterDiscount,
    this.image,
    this.category,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    description = json["description"];
    stock = json["stock"];
    bestSeller = json["best_seller"];
    price = json["price"];
    discount = json["discount"];
    priceAfterDiscount = json["price_after_discount"];
    image = json["image"];
    category = json["category"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["description"] = description;
    _data["stock"] = stock;
    _data["best_seller"] = bestSeller;
    _data["price"] = price;
    _data["discount"] = discount;
    _data["price_after_discount"] = priceAfterDiscount;
    _data["image"] = image;
    _data["category"] = category;
    return _data;
  }
}
