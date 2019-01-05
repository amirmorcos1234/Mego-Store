import 'package:flutter/material.dart';
import 'package:market_me/ui/signUpForm.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('Create Account'),
      ),
      body:ListView(
       
      children: <Widget>[
        
        Padding(padding: const EdgeInsets.only(top:20),),
       
        SignUpForm()
      ],
    ));
  }
}
