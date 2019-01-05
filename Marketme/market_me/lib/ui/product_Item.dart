import 'package:flutter/material.dart';
import 'package:market_me/model/product.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:market_me/ui/product_Details.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  ProductItem({this.product});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 180,
          width: 150,
          color: Colors.white,
          child: InkWell(
            child: Image.asset("images/water.png"),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => new ProductDetails(
                      product: product,
                    ))),
          ),
        ),
        Container(
            width: 150,
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(product.name)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StarRating(
              rating: product.rate,
              color: Colors.yellow,
              borderColor: Colors.white,
              size: 20.0,
            ),
            Container(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text('\$${product.price}'))
          ],
        ),
      ],
    );
  }
}
