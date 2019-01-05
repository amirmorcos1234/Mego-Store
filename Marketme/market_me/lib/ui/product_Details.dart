import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:market_me/model/product.dart';
import 'package:market_me/ui/imageSlider.dart';

class ProductDetails extends StatefulWidget {
  final Product product;
  ProductDetails({this.product});
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.product.name),
        ),
        body: ListView(
          children: <Widget>[
            ImageSlider(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Container(
                    margin: const EdgeInsets.only( left: 10),
                    child: Text(widget.product.name)),
                     SizedBox(
                  height: 20,
                ),
                Container(
                    margin: const EdgeInsets.only( left: 10),
                    child: Text("\$${widget.product.price.toString()}"))
              ],
            )
          ],
        ));
  }
}
