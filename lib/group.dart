import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Group extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(child: Text('1'), radius: 20, backgroundColor: Colors.deepOrange,),
                  CircleAvatar(child: Text('2'), radius: 20, backgroundColor: Colors.deepOrange,),
                ],
              ),
              Text('June 5', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              Text('Hello hi\nhellohi'),
              IconButton(
                icon: Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
          width: double.infinity,)
    );
  }
}