import 'package:flutter/material.dart';
import 'package:market_me/assets/Colors/colors.dart';

class CustomAppBarWithSearch extends StatelessWidget with PreferredSizeWidget {
  final String title;
  CustomAppBarWithSearch({this.title});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: CustomColors.titleColor),
      backgroundColor:CustomColors.appBarColor ,
      title: Text(
        this.title,
        style: TextStyle(
          color: CustomColors.titleColor
        ),
      ),
      actions: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: CustomColors.titleColor,
                  ),
                )
              ],
            );
  }
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(30,50);
}