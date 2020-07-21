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
      title: 'Covid App',
      theme: ThemeData(
        primaryColor: Colors.red[400],
//        accentColor: Colors.redAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Covid Social Tracking'),),
        ),
        body: [
          States(),
          MyMap(),
          Circles(),
          Column(
            children: [
              SizedBox(height: 10,),
              CircleAvatar(
                backgroundColor: Colors.brown.shade800,
                child: Text('Me',
                  textWidthBasis: TextWidthBasis.longestLine,),
              ),
              SizedBox(height: 10,),
              Text('My Journal', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              SizedBox(height: 20,),
              Journal(),
              Journal(),
              Journal(),
              Journal(),
              Journal(),
            ]
          ),
          Center(child: States(),)
        ][_current_index],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _current_index,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
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
