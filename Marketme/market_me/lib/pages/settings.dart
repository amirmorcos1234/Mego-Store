import 'package:flutter/material.dart';
import 'package:market_me/assets/Colors/colors.dart';
import 'package:market_me/ui/customCard.dart';
import 'package:market_me/ui/customList.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEBF2F7),
      appBar: AppBar(
        title: Text('Settings',style: TextStyle(color: Colors.black),),
        elevation: 0.0,
        backgroundColor: Color(0xffEBF2F7),
        actions: <Widget>[
          FlatButton(
            onPressed: () {},
            child: Text('SIGN OUT', style: TextStyle(color: CustomColors.red)),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          CustomList(
            title: 'Account Settings',
            card1: CustomCard(
              cardIconLeft: Icons.person,
              cardText: 'Manage profile name & email',
              iconBorderColor: Colors.grey,
              cardRightSide: Icon(Icons.arrow_forward),
              bottom: true,
            ),
            card2: CustomCard(
              cardIconLeft: Icons.camera_alt,
              iconBorderColor: Colors.green,
              cardText: 'Change profile photo',
              cardRightSide: Icon(Icons.photo),
              bottom: true,
            ),
          ),
          CustomList(
            title: 'NOTIFICATIONS',
            card1: CustomCard(
              bottom: false,
              cardIconLeft: Icons.notifications,
              cardText: 'PushNotification',
              iconBorderColor: CustomColors.red,
              cardRightSide: Switch(
                value: true,
                activeColor: Colors.white,
                activeTrackColor: Colors.lightBlue[300],
                onChanged: (value) {},
              ),
            ),
          ),
          CustomList(
            title: 'SECURITY',
            card1: CustomCard(
              bottom: false,
              cardIconLeft: Icons.lock,
              cardText: 'change or manage password',
              iconBorderColor: Colors.blue,
              cardRightSide: Icon(Icons.arrow_forward),
            ),
          ),
          CustomList(
            title: 'PAYMENT',
          
            card1: CustomCard(
              bottom: true,
              cardIconLeft: Icons.my_location,
              cardText: 'Shipping information',
              iconBorderColor: Colors.orange[900],
              cardRightSide: Icon(Icons.arrow_forward),
              
            ),
            card2: CustomCard(
              cardIconLeft: Icons.folder,
              iconBorderColor: Colors.black,
              cardText: 'My wallet',
              cardRightSide: Icon(Icons.arrow_forward),
              bottom: true,
            ),
          )
        ],
      ),
    );
  }
}
