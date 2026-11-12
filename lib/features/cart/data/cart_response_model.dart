class CartResponseModel {
  CartData? data;
  String? message;
  int? status;

  CartResponseModel({this.data, this.message, this.status});

  CartResponseModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? CartData.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }
}

class CartData {
  int? id;
  CartUser? user;
  String? total;
  List<CartItemModel>? cartItems;

  CartData({this.id, this.user, this.total, this.cartItems});

  CartData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? CartUser.fromJson(json['user']) : null;
    total = json['total'];

    cartItems = json['cart_items'] != null
        ? (json['cart_items'] as List)
              .map((item) => CartItemModel.fromJson(item))
              .toList()
        : [];
  }
}

class CartUser {
  int? userId;
  String? userName;

  CartUser({this.userId, this.userName});

  CartUser.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userName = json['user_name'];
  }
}

class CartItemModel {
  int? itemId;
  int? itemProductId;
  String? itemProductName;
  String? itemProductImage;
  String? itemProductPrice;
  int? itemProductDiscount;
  double? itemProductPriceAfterDiscount;
  int? itemProductStock;
  int? itemQuantity;
  double? itemTotal;

  CartItemModel({
    this.itemId,
    this.itemProductId,
    this.itemProductName,
    this.itemProductImage,
    this.itemProductPrice,
    this.itemProductDiscount,
    this.itemProductPriceAfterDiscount,
    this.itemProductStock,
    this.itemQuantity,
    this.itemTotal,
  });

  CartItemModel.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    itemProductId = json['item_product_id'];
    itemProductName = json['item_product_name'];
    itemProductImage = json['item_product_image'];
    itemProductPrice = json['item_product_price'];
    itemProductDiscount = json['item_product_discount'];

    itemProductPriceAfterDiscount =
        (json['item_product_price_after_discount'] as num?)?.toDouble();

    itemProductStock = json['item_product_stock'];
    itemQuantity = json['item_quantity'];

    itemTotal = (json['item_total'] as num?)?.toDouble();
  }
}
