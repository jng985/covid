import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Journal extends StatelessWidget {
  final String _journalText;
  final String _date;
  Journal(this._date, this._journalText);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
//            CircleAvatar(
//                child: Text(_journalText, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
//                radius: 70,
//                backgroundColor: Colors.blue,
//              ),
              Text(_date, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              Text(_journalText, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
              IconButton(
                icon: Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
        width: double.infinity,)
      );
  }
}