import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './line_chart.dart';
import './group.dart';
import 'package:charts_flutter/flutter.dart' as charts;

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
              CircleAvatar(
                child: Text('Me'),
                radius: 50,
                backgroundColor: Colors.blue,
              ),
              Text(_status),
//              Container(
//                  height: 50,
//                  child: Expanded(child: SimpleLineChart.withSampleData(),)),
//              Group(),
              IconButton(
                icon: Icon(Icons.settings),
              ),
            ],
          ),
          width: double.infinity)
    );
  }
}