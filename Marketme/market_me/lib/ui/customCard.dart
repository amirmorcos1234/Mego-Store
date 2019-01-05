import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
   final IconData cardIconLeft;
  final String cardText;
  final Widget cardRightSide;
  final Color iconBorderColor;
  final bool bottom;
  CustomCard({this.bottom,this.cardText,this.cardRightSide,this.cardIconLeft,this.iconBorderColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:bottom?const EdgeInsets.only(bottom: 10):const EdgeInsets.all(0.0),
        height: 60,
        color: Colors.white,
        child:ListTile(
        title: Text(this.cardText),
        trailing: this.cardRightSide,
        leading:Container(
          height: 30,
          width:30,
          child: Icon(this.cardIconLeft,color: Colors.white,size:20.0,),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: this.iconBorderColor
          ),
        )));
  }
}
