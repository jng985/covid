import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './line_chart.dart';
import './group.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import './other.dart';

class Account extends StatelessWidget {
  final String _status = 'My Account';

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
//          height: 500,
          margin: EdgeInsets.all(25.0),
//          height: 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.asset('assets/p8.jpg'),
                  Column(
                    children: <Widget>[
                      Text("Points: 29", style: TextStyle(fontSize: 30),),
                      SizedBox(height: 10,),
                      Text("Last Test Date: July 20", style: TextStyle(fontSize: 24),),
                    ],
                  )
                ],
              ),

              Container(
                  height: 60,
                  child: RaisedButton(
                    child: Container(child: Text('Reedem Points',
                      style: TextStyle(fontSize: 20, color: Colors.white),)),
                    color: Colors.orange,
                    onPressed:  () {},
                  )),
//            SizedBox(height: 10,),
            Container(
              height: 60,
//              width: 120,
              child: RaisedButton(
                child: Container(child: Text('Verify Testing',
                  style: TextStyle(fontSize: 20, color: Colors.white),)),
                color: Colors.blue,
                onPressed:  () {},
              )),
              Container(
                  height: 60,
                  width: 100,
                  child: RaisedButton(
                    child: Container(child: Text('Donate',
                      style: TextStyle(fontSize: 20, color: Colors.white),)),
                    color: Colors.green,
                    onPressed:  () {},
                  )),
              Container(
                  height: 60,
                  child: RaisedButton(
                    child: Container(child: Text('Watch Ad',
                      style: TextStyle(fontSize: 20, color: Colors.white),)),
                    color: Colors.purple,
                    onPressed:  () {},
                  )),
              IconButton(
                iconSize: 60,
                icon: Icon(Icons.settings),
              ),
            ],
          ),
          width: double.infinity)
    );
  }
}