import 'package:flutter/material.dart';
import 'package:market_me/ui/customCard.dart';

class CustomList extends StatelessWidget {
  final String title;
  final CustomCard card1;
  final CustomCard card2;
  CustomList({this.title, this.card1, this.card2});
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      ListTile(
        title: Text(this.title),
      ),
      this.card1,
     this.card2??Text('')
    ]);
  }
}
