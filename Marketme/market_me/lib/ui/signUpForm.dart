import 'package:flutter/material.dart';
import 'package:market_me/assets/Colors/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:market_me/helpers/PhotoBottomSheet.dart';
import 'package:market_me/helpers/firebase.dart';
import 'package:market_me/helpers/loadingModal.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final PhotoBottomSheet _photoBottomSheet=PhotoBottomSheet();
  String _error;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FirebaseHelper _firebaseHelper = new FirebaseHelper();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Center(
            child: CircleAvatar(
              radius: 40,
              child: IconButton(
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  _photoBottomSheet.showPictureSheet(context);
                },
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          TextFormField(
            textAlign: TextAlign.center,
            style: TextStyle(height: 2, color: CustomColors.inputColor),
            controller: _nameController,
            validator: (String emailValue) {
              if (emailValue.isEmpty) {
                return 'Name is required';
              }
            },
            decoration: InputDecoration(
                hintText: 'Name',
                fillColor: CustomColors.inputDecorationColor,
                filled: true,
                border: InputBorder.none),
          ),
          TextFormField(
            textAlign: TextAlign.center,
            style: TextStyle(height: 2, color: CustomColors.inputColor),
            controller: _emailController,
            validator: (String emailValue) {
              Pattern pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regex = new RegExp(pattern);

              if (emailValue.isEmpty) {
                return 'Email is required';
              } else if (!regex.hasMatch(emailValue))
                return 'Enter valid email address';
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
              } else if (value.length < 6) {
                return 'Password must be 6 characters';
              }
            },
            obscureText: true,
            decoration: InputDecoration(
                hintText: 'Password',
                fillColor: CustomColors.inputDecorationColor,
                filled: true,
                border: InputBorder.none),
          ),
          TextFormField(
            controller: _confirmPassword,
            textAlign: TextAlign.center,
            style: TextStyle(height: 2, color: CustomColors.inputColor),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Confirm password is required';
              } else if (value != _passwordController.text) {
                return 'Confirm password must be equal password';
              }
            },
            obscureText: true,
            decoration: InputDecoration(
                hintText: 'Confirm Password',
                fillColor: CustomColors.inputDecorationColor,
                filled: true,
                border: InputBorder.none),
          ),
          SizedBox(
            height: 20,
          ),
          _error != null ? Text(_error,style: TextStyle(color: CustomColors.red),) : Text(''),
          SizedBox(
            height: 20,
          ),
          ConstrainedBox(
              constraints: const BoxConstraints(
                  minWidth: double.infinity, minHeight: 60.0),
              child: RaisedButton(
                color: CustomColors.inputColor,
                onPressed: () => signUp(context),
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
              )),
          ConstrainedBox(
              constraints: const BoxConstraints(
                  minWidth: double.infinity, minHeight: 60.0),
              child: RaisedButton(
                color: Color(0xFF2A6CFA),
                onPressed: signWithFacebook,
                child: Text(
                  'Sign Up with facebook',
                  style: TextStyle(color: CustomColors.white),
                ),
              )),
          ConstrainedBox(
              constraints: const BoxConstraints(
                  minWidth: double.infinity, minHeight: 60.0),
              child: RaisedButton(
                color: Colors.red[400],
                onPressed:signWithGoogle,
                child: Text(
                  'Sign Up with Gmail',
                  style: TextStyle(color: CustomColors.white),
                ),
              ))
        ],
      ),
    );
  }

  signUp(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      LoadingModal.showModal(context);
      try {
        FirebaseUser user = await _firebaseHelper.registerUser(
            email: _emailController.text,
            name: _nameController.text,
            password: _passwordController.text,
            photo: null);
        Navigator.of(context).pop();
        setState(() {
                  _error=null;
                });

      
      } catch (error) {
        
        setState(() {
          _error = "The email address is already in use";
        });
      } finally {
        Navigator.of(context).pop();
      }
    }
  }

  signWithGoogle()async{
    try{
    await _firebaseHelper.googleSignIn();
    }
    catch(error){

    }
   
  }
  signWithFacebook()async{
    try{
    await _firebaseHelper.facebookSignIn();
    }
    catch(error){

    }
  }
  

}
