import 'package:flutter/material.dart';
import 'package:market_me/ui/signInForm.dart';
import 'dart:io';

class SignIn extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        backgroundColor: Color(0xffEBF2F7),
        body: ListView(
      
          children: <Widget>[
            Center(
                child: Container(
              height: 300,
              child: Text('SignIn'),
            )),
           SignInForm(),
            Container(
              alignment: Alignment.bottomCenter,
              
              margin: const EdgeInsets.only(bottom: 10,top:5),
              child: RichText(
                text: TextSpan(
                  children:[
                    TextSpan(text: 'By signing in, you accept our ',
                    
                    style: TextStyle(
                      color: Colors.grey[500],
                      

                    )),
                    TextSpan(text: 'Terms and Conditions',style: TextStyle(
                      color:Colors.black 
                    )
                    )
                    
                  ] 
                ),
              ),
            )
          ],
        ));
  }
}
