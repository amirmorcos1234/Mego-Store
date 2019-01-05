import 'package:flutter/material.dart';

class Product {
  String id;
  String details;
  String name;
  int price;
  double rate;
  List<dynamic> thumbnails;
  Product({this.id,this.details,this.name,this.price,this.rate,this.thumbnails});
}
