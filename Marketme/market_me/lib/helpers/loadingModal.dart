import 'package:flutter/material.dart';
import 'package:market_me/assets/Colors/colors.dart';

class LoadingModal{

  static showModal(BuildContext context) {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Column(
              children: <Widget>[
                Row(children: <Widget>[
                  CircularProgressIndicator(
                    backgroundColor: CustomColors.red,
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 30),
                      child: Text('Loading'))
                ]),
                Center(child: Text('Please wait...'))
              ],
            ),
          );
        });
  }
}