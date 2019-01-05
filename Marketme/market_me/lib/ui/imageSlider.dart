import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class ImageSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      width: 300.0,
      child: Carousel(
        images: [
          ExactAssetImage("images/water.png"),
          ExactAssetImage("images/water.png"),
          ExactAssetImage("images/water.png")

        ],
        dotSize: 5.0,
        indicatorBgPadding: 10.0,
        
      ),
    );
  }
}