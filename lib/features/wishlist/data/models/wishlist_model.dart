import 'package:bookia_app/features/home/data/models/books_model.dart';

class WishlistModel {
  WishlistData? data;
  String? message;
  int? status;

  WishlistModel({this.data, this.message, this.status});

  WishlistModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? WishlistData.fromJson(json['data']) : null;

    message = json['message'];
    status = json['status'];
  }
}

class WishlistData {
  int? currentPage;
  List<Products>? products;
  int? total;

  WishlistData({this.currentPage, this.products, this.total});

  WishlistData.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];

    products = json['data'] != null
        ? (json['data'] as List).map((e) => Products.fromJson(e)).toList()
        : [];

    total = json['total'];
  }
}
