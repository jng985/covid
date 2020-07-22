import 'package:flutter/material.dart';
import './journal.dart';

class CircleCarousel extends StatelessWidget {
  var _journals = [
    Container(
      margin: EdgeInsets.all(20.0),
      child: SingleChildScrollView(child: Text('Hello, this is my latest COVID-19 journal.'))
    ),
    Container(
        margin: EdgeInsets.all(20.0),
        child: SingleChildScrollView(child: Text('Hi, Journal 2 text goes here.'))
    ),
    Container(
        margin: EdgeInsets.all(20.0),
        child: SingleChildScrollView(child: Text('Journal 3 Text'))
    ),
    Container(
        margin: EdgeInsets.all(20.0),
        child: SingleChildScrollView(child: Text('Journal 4 Text'))
    ),
  ];
  var _journals2 = [Journal('July','19'), Journal('June', '18'), Journal('May','17'), Journal('April', '16'),];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 450,
//      color: Colors.blue,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.all(10.0),
              width: 220,
//              color: Colors.red,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    bottom: 15.0,

                  child: Container(
                    height: 330,
                    width: 220,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _journals[index]
                      ],
                    ),
                  )),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0.0, 2.0),
                          blurRadius: 6.0,
                          )
                      ]
                    ),
                    child: Stack(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: _journals2[index],
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
//            _circles[index];
          }),

    );
  }
}