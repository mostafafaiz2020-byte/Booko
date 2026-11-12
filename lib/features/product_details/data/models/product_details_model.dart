import 'package:bookia_app/features/home/data/models/books_model.dart';

class ProductDetailsModel {
  Products? data;
  String? message;
  int? status;

  ProductDetailsModel({this.data, this.message, this.status});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Products.fromJson(json['data']) : null;

    message = json['message'];
    status = json['status'];
  }
}
