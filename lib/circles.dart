import 'package:flutter/material.dart';
import './group.dart';

class Circles extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CircleState();
  }
}
class _CircleState extends State<Circles> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: <Widget>[
          Text('My Circles', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          Group(),
          Container(height: 200,
          child: ListView(children: <Widget>[Text('hi'), Text('hello')],),),
          Container(height: 200,
            child: ListView(children: <Widget>[Text('hi'), Text('hello')],),),
          FloatingActionButton(
            child: Icon(Icons.add_circle),
            backgroundColor: Colors.green,
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                      elevation: 16,
                      child: Container(
                          height: 380,
                          width: 360,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: <Widget>[
                                Text('My Status', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                                Row(
                                  children: <Widget>[
                                    Text('Preset Status Update 1'),
                                    Spacer(),
                                    IconButton(icon: Icon(Icons.check_box_outline_blank),
                                      onPressed: () {},)
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text('Preset Status Update 2'),
                                    Spacer(),
                                    IconButton(icon: Icon(Icons.check_box_outline_blank),
                                      onPressed: () {},)
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text('Preset Status Update 3'),
                                    Spacer(),
                                    IconButton(icon: Icon(Icons.check_box_outline_blank),
                                      onPressed: () {},)
                                  ],
                                ),
                                SizedBox(height: 20,),
                                IconButton(icon: Icon(Icons.check_circle),
                                  iconSize: 50,
                                  onPressed: () {},),
                              ],
                            ),
                          )
                      ),
                    );
                  }
              );
            },
          ),
        ],
      ),
    );
  }
}
