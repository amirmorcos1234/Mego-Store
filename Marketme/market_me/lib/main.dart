import 'package:flutter/material.dart';
import 'package:market_me/pages/signIn.dart';
import 'package:market_me/scoped_models/mainModels.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>( 
      model: MainModel(),
    child: MaterialApp(
      title: 'marketMe',
      
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:SignIn()
    )
    );
  }
}
