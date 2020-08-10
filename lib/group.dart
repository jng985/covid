import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './journal.dart';
class Group extends StatelessWidget {
  var _journals = [
    Container(
        margin: EdgeInsets.all(20.0),
        child: Container(child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
        IconButton(icon: Icon(Icons.people)),
          Image.asset('assets/p1.jpg', height: 40,),
          Image.asset('assets/p3.jpg', height: 40,),
          Image.asset('assets/p4.jpg', height: 40,),
          Image.asset('assets/p6.jpg', height: 40,),
//          CircleAvatar(child: Text('1'), radius: 15, backgroundColor: Colors.teal,),
//          CircleAvatar(child: Text('2'), radius: 15, backgroundColor: Colors.teal,),
//          CircleAvatar(child: Text('3'), radius: 15, backgroundColor: Colors.teal,),
//          CircleAvatar(child: Text('4'), radius: 15, backgroundColor: Colors.teal,),
//          CircleAvatar(child: Text('5'), radius: 15, backgroundColor: Colors.teal,),
        ],))
    ),
    Container(
        margin: EdgeInsets.all(20.0),
        child: Container(child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
          IconButton(icon: Icon(Icons.people)),
          Image.asset('assets/p9.jpg', height: 40,),
          Image.asset('assets/p10.jpg', height:40,),
          Image.asset('assets/p5.jpg', height: 40,),


        ],))
    ),
    Container(
        margin: EdgeInsets.all(20.0),
        child: Container(child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
          IconButton(icon: Icon(Icons.people)),
          CircleAvatar(child: Text('1'), radius: 15, backgroundColor: Colors.orange,),
          CircleAvatar(child: Text('2'), radius: 15, backgroundColor: Colors.orange,),
          CircleAvatar(child: Text('3'), radius: 15, backgroundColor: Colors.orange,),
          CircleAvatar(child: Text('4'), radius: 15, backgroundColor: Colors.orange,),
        ],))
    ),
  ];
  var _journals2 = [Container(
      child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Journal('Circle 1','Friends'),
          ]
      )),
    Journal('Circle 2', 'Family'),
    Journal('Circle 3','Co-Workers')];


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Container(
          height: 450,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.all(10.0),
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                                color: Colors.blueGrey,
//                        color: Colors.white,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 6.0,
                      )
                    ]
                ),
                  child: Stack(
                    children: <Widget>[

                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
//                                color: Colors.black26,
                                color: Colors.white,
                                offset: Offset(0.0, 0.0),
                                blurRadius: 0.0,
                              )
                            ]
                        ),
                        child: Stack(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Container(child:Column(children: <Widget>[
                                _journals[index],
                                _journals2[index],
                                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: <Widget>[

                                    IconButton(icon: Icon(Icons.my_location),),
                                    IconButton(icon: Icon(Icons.history),),
                                  IconButton(icon: Icon(Icons.notifications),),

                                  IconButton(icon: Icon(Icons.message),),
                                ],),
                              ],)),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
//            _circles[index];
              }),
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: <Widget>[
//              Row(
//                children: <Widget>[
//                  CircleAvatar(child: Text('1'), radius: 20, backgroundColor: Colors.deepOrange,),
//                  CircleAvatar(child: Text('2'), radius: 20, backgroundColor: Colors.deepOrange,),
//                ],
//              ),
//              Text('June 5', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
//              Text('Hello hi\nhellohi'),
//              IconButton(
//                icon: Icon(Icons.arrow_forward_ios),
//              ),
//            ],
//          ),
          width: double.infinity,)
    );
  }
}