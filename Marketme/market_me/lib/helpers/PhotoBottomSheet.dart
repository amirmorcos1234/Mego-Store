import 'package:flutter/material.dart';

class PhotoBottomSheet {
  showPictureSheet(BuildContext context) {
    showBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
              color: Colors.white,
              height: 150,
              width: 500,
              child: Column(crossAxisAlignment: CrossAxisAlignment.end,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                        alignment: Alignment.bottomLeft,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.close)),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            IconButton(
                                //  alignment: Alignment.centerRight,
                                onPressed: () {
                                  //Navigator.of(context).pop();
                                },
                                icon: Icon(Icons.camera_alt)),
                            Text('Camera'),
                          ],
                        ),
                        Column(children: <Widget>[
                          IconButton(
                              //  alignment: Alignment.centerRight,
                              onPressed: () {
                                //Navigator.of(context).pop();
                              },
                              icon: Icon(Icons.photo)),
                          Text('Gallery')
                        ])
                      ],
                    )
                  ]));
        });
  }
}
