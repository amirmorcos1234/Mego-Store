import 'package:flutter/material.dart';
import 'package:market_me/model/product.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ProductModel extends Model{
  List<Product> products=new List();

  List<Product> getProduct( AsyncSnapshot<QuerySnapshot> productSnapshots){
  products= productSnapshots.data.documents.map((DocumentSnapshot productRecord){
    return Product(
      id: productRecord['id'],
      details: productRecord['details'],
      name:productRecord['name'],
      price: productRecord['price'],
      rate: (productRecord['rate'] as num) as double
    );
   }).toList();
   return products;

  }
}