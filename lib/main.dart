import 'package:flutter/material.dart';
import 'package:requests/requests.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:location_permissions/location_permissions.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:emoji_picker/emoji_picker.dart';
import './state.dart';
import './mymap.dart';
import './journal.dart';
import './circles.dart';
import './group.dart';
import './carousel.dart';
import './CategorySelector.dart';
import './account.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _current_index = 0;
  var _state = 'ny';
  var _emoji = '';
  String _state_info_str = 'Select State';
  String _positive = '';
  void _get_state_current(String state) async {
    var url = "https://covidtracking.com/api/v1/states/$state/current.json";
    var r = await Requests.get(url);
    r.raiseForStatus();
    setState(() {
      _positive = r.json()['positive'].toString();
    });
  }
  void _get_state(String state) async {
    var url = "https://covidtracking.com/api/v1/states/$state/info.json";
    var r = await Requests.get(url);
    r.raiseForStatus();
    var _notes = r.json()['notes'];
    setState(() {
      _state = state;
      _notes = _notes.split('\n').reversed.join('\n');
      _state_info_str = _notes.replaceAll('\n', '\n\n');
    });
  }
  void _req_location() async {
    await LocationPermissions().requestPermissions();
  }
  GoogleMapController mapController;

  final LatLng _center = const LatLng(40.688841, -74.044015);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid App',
      theme: ThemeData(
        primaryColor: Colors.red[400],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Covid Social Tracking App'),),
        ),
        body: [
          States(),
          MyMap(),
          Container(
            margin: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 15.0,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                  CircleAvatar(
                    child: Text('Me'),
                    radius: 40,
                    backgroundColor: Colors.blue,
                  ),
                  Text('My Circles        ',
                    style: TextStyle(fontSize: 30),),
                ]),
                Group(),
                SizedBox(height: 50.0,),
                Container(height: 60.0,
                    child:
                RaisedButton(
                  child: Text('Create New Circle',
                    style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 1.2,
                        color: Colors.white), ),
                  color: Colors.lightGreen,
                  onPressed: () {},
                ))
              ],
            ),
          ),
//          CategorySelector(),
          Column(
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 35.0,
                          backgroundColor: Colors.blue,
                          child: Text('Me',
                            textWidthBasis: TextWidthBasis.longestLine,),
                        ),
                        Spacer(),
                        Text('My Journal',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold)),
                        Spacer(),
                      ],
                    ),
                    width: double.infinity,)
              ),
              SizedBox(height: 10,),
//              Group(),
              CircleCarousel(),
              Row(
                children: <Widget>[
                  Spacer(),
                  FloatingActionButton(
                    child: IconButton(
                      icon: Icon(Icons.add),
                      iconSize: 40.0,
                      onPressed: () {},
                      focusColor: Colors.blueGrey,
                    ),
                  ),
                  Spacer()
                ],
              )
            ]
          ),
Account(),
//          Center(child: Text(''),)
        ][_current_index],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _current_index,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.location_city),
              title: Text('State Info'),
              backgroundColor: Colors.red[400]
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.location_on),
                title: Text('Map'),
                backgroundColor: Colors.red[400]
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.supervised_user_circle),
                title: Text('My Circles'),
                backgroundColor: Colors.red[400]
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.assignment),
                title: Text('Journal'),
                backgroundColor: Colors.red[400]
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                title: Text('Account'),
                backgroundColor: Colors.red[400]
            )
          ],
          onTap: (index) {
            _req_location();
            setState(() {
              _current_index = index;
            });
          },
        ),
      ),
    );
  }
}
