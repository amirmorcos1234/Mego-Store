import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:market_me/assets/Colors/colors.dart';
import 'package:market_me/helpers/loadingModal.dart';
import 'package:market_me/pages/home.dart';

import 'package:market_me/pages/signUp.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _error;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            textAlign: TextAlign.center,
            style: TextStyle(height: 2, color: CustomColors.inputColor),
            controller: _emailController,
            validator: (String emailValue) {
              if (emailValue.isEmpty) {
                return 'Email is required';
              }
            },
            decoration: InputDecoration(
                hintText: 'Email',
                fillColor: CustomColors.inputDecorationColor,
                filled: true,
                border: InputBorder.none),
          ),
          TextFormField(
            controller: _passwordController,
            textAlign: TextAlign.center,
            style: TextStyle(height: 2, color: CustomColors.inputColor),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Password is required';
              }
            },
            obscureText: true,
            decoration: InputDecoration(
                hintText: 'Password',
                fillColor: CustomColors.inputDecorationColor,
                filled: true,
                border: InputBorder.none),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.only(top: 5.0),
          child: _error != null
                ? Text(
                    _error,
                    style: TextStyle(color: CustomColors.red),
                  )
                : Text(''),
          )),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  'Forgot password?',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => new SignUp()));
                  },
                  child: Container(
                    child: Text('Create account'),
                  ))
            ],
          ),
          ConstrainedBox(
              constraints: const BoxConstraints(
                  minWidth: double.infinity, minHeight: 60.0),
              child: RaisedButton(
                color: Colors.white,
                onPressed: () => firebaseSign(context),
                child: Text('Sign In'),
              )),
          ConstrainedBox(
              constraints: const BoxConstraints(
                  minWidth: double.infinity, minHeight: 60.0),
              child: RaisedButton(
                color: Color(0xFF2A6CFA),
                onPressed: () {},
                child: Text(
                  'Sign In with facebook',
                  style: TextStyle(color: CustomColors.white),
                ),
              )),
          ConstrainedBox(
              constraints: const BoxConstraints(
                  minWidth: double.infinity, minHeight: 60.0),
              child: RaisedButton(
                color: Colors.red[400],
                onPressed: () {},
                child: Text(
                  'Sign In with Gmail',
                  style: TextStyle(color: CustomColors.white),
                ),
              ))
        ],
      ),
    );
  }

  firebaseSign(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      FirebaseUser user;
      try {
        LoadingModal.showModal(context);
        user = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text);
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
      } catch (error) {
        setState(() {
          _error = "The user is not found";
        });
      } finally {
        Navigator.of(context).pop();
      }
    } else {
      debugPrint('hi');
      print('hi');
    }
  }
}
