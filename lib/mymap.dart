import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location_permissions/location_permissions.dart';

class MyMap extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyMapState();
  }
}
class _MyMapState extends State<MyMap> {
  var _myStatus = null;
  var _show_test_centers = false;
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
    return Column(
        children:[
          Container(height:300,
          child: GoogleMap(
              myLocationEnabled: true,
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              )
          ),),
          Container(
            height: 250,
            child: Text('Covid Map', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          ),
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
                      height: 440,
                      width: 400,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[
                            Text('My Status', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                            Row(
                              children: <Widget>[
                                Text('I tested positive for COVID - Nasal'),
                                Spacer(),
                                IconButton(icon: Icon(Icons.check_box_outline_blank),
                                onPressed: () {},)
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text('I have COVID antibodies'),
                                Spacer(),
                                IconButton(icon: Icon(Icons.check_box_outline_blank),
                                  onPressed: () {},)
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text('I tested negative for COVID - Nasal'),
                                Spacer(),
                                IconButton(icon: Icon(Icons.check_box_outline_blank),
                                  onPressed: () {},)
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text('I tested negative for COVID - Antibodies'),
                                Spacer(),
                                IconButton(icon: Icon(Icons.check_box_outline_blank),
                                  onPressed: () {},)
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text('I have COVID symptoms & tested positive - Nasal'),
                                Spacer(),
                                IconButton(icon: Icon(Icons.check_box_outline_blank),
                                  onPressed: () {},)
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text('I have COVID symptoms, no test'),
                                Spacer(),
                                IconButton(icon: Icon(Icons.check_box_outline_blank),
                                  onPressed: () {},)
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text('I just tested negative after being positive and recuperating'),
                                Spacer(),
                                IconButton(icon: Icon(Icons.check_box_outline_blank),
                                  onPressed: () {},)
                              ],
                            ),
//                            SizedBox(height: 100,),
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
          )
        ]
    );
  }
}