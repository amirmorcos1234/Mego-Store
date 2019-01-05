import 'package:flutter/material.dart';
import 'package:market_me/assets/Colors/colors.dart';
import 'package:market_me/pages/settings.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      child:Container(
        color: CustomColors.sideMenuUser,
        child:Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration:BoxDecoration(
              color: CustomColors.sideMenuUser
            ) ,
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person)),
            accountEmail: Text('amir@gmail.com',style: TextStyle(
              color: CustomColors.inputColor
            ),),
            accountName: Text('Amir Hesham',style: 
            TextStyle(color: CustomColors.inputColor),),
          ),
          ListTile(
            title: Text("Home"),
            leading: Icon(Icons.home),
          ),
          ListTile(
            title: Text("Collections"),
            leading: Icon(Icons.folder),
             
                      ),
          ListTile(
            title: Text("New items"),
            leading: Icon(Icons.flash_on),
          ),
          ListTile(
            title: Text("My offers"),
            leading: Icon(Icons.menu),
          ),
           ListTile(
            title: Text("Settings"),
            leading: Icon(Icons.settings),
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context)=>Settings()
                )
              );
            },
          ),
           ListTile(
            title: Text("About"),
            leading: Icon(Icons.info),
            
          ),
          Center(
            child: FlatButton(
              child: Text('Log out',style: TextStyle(
                color: CustomColors.red
              ),),
              
            ),
          )
          
        ],
      ),
    ));
  }
}
