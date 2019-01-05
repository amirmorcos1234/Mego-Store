import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:market_me/scoped_models/mainModels.dart';
import 'package:market_me/ui/customAppBar.dart';
import 'package:market_me/ui/drawer.dart';
import 'package:market_me/ui/imageSlider.dart';
import 'package:market_me/ui/product_Item.dart';
import 'package:scoped_model/scoped_model.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (context, widget, model) {
        return Scaffold(
          backgroundColor: Color(0xffE5E7EC),
           appBar: CustomAppBarWithSearch(title: "Home"),
            drawer: CustomDrawer(),
            body: ListView(
                // height: 200,
                // width: 600,
                children: <Widget>[
                  ImageSlider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('New Items'),
                      RaisedButton(
                        child: Text('More'),
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        color: Colors.white,
                      )
                    ],
                  ),

                  //width: 100,
                  StreamBuilder(
                    stream:
                        Firestore.instance.collection('products').snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return Center(
                              child: CircularProgressIndicator(
                                  // value:100.0,
                                  ));
                          break;
                        case ConnectionState.active:
                        case ConnectionState.done:
                          // print(snapshot.data.documents[0]['details']);
                          // model.productModel.getProducts(snapshot);

                          return new Container(
                              margin: const EdgeInsets.only(left: 20, top: 10),
                              height: 250.0,
                              // width: 100.0,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: model.productModel
                                      .getProduct(snapshot)
                                      .length,
                                  itemBuilder: (context, index) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        ProductItem(
                                            product: model
                                                .productModel.products[index]),
                                        SizedBox(
                                          width: 20,
                                        )
                                      ],
                                    );
                                  }));

                          break;
                        default:
                      }
                    },
                  )
                ]));
      },
    );
  }
}
