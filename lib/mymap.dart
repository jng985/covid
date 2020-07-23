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
  Set<Polyline> _polylines = {};
  void _req_location() async {
    await LocationPermissions().requestPermissions();
  }
  GoogleMapController mapController;
  static const LatLng _center = const LatLng(45.521563, -122.677433);

  final Set<Marker> _markers = {};

  LatLng _lastMapPosition = _center;

  void _addLine(LatLng start, LatLng end) {
    setState(() {
      _polylines.add(Polyline(
//          polylineId: PolylineId(segName),
          visible: true,
          points: [start, end],
          width: 8,
          color: Colors.green));
    });
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }
  void _onAddMarkerButtonPressed() {
    setState(() {
//      _addLine(LatLng(40.712775122806555, -74.00597155094147), _lastMapPosition);
      print(_lastMapPosition);
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: 'Really cool place',
          snippet: '5 Star Rating',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
        children:[
          Container(height:300,
          child: GoogleMap(
              polylines: _polylines,
              myLocationEnabled: true,
              onMapCreated: _onMapCreated,
              markers: _markers,
              onCameraMove: _onCameraMove,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              )
          ),),
          
          Container(
            margin: EdgeInsets.all(20.0),
            height: 40,
            child: RaisedButton(
              color: Colors.blue,
              onPressed: (){
                _onAddMarkerButtonPressed();
              },
            ),
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
                      height: 460,
                      width: 400,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[
                            Text('My Status', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                            Row(
                              children: <Widget>[
                                Text('I tested positive for COVID - Nasal',style: TextStyle(fontSize: 12),),
                                Spacer(),
                                IconButton(icon: Icon(Icons.check_box_outline_blank),
                                onPressed: () {},)
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text('I have COVID antibodies',style: TextStyle(fontSize: 12),),
                                Spacer(),
                                IconButton(icon: Icon(Icons.check_box_outline_blank),
                                  onPressed: () {},)
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text('I tested negative for COVID - Nasal',style: TextStyle(fontSize: 12),),
                                Spacer(),
                                IconButton(icon: Icon(Icons.check_box_outline_blank),
                                  onPressed: () {},)
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text('I tested negative for COVID - Antibodies',style: TextStyle(fontSize: 12),),
                                Spacer(),
                                IconButton(icon: Icon(Icons.check_box_outline_blank),
                                  onPressed: () {},)
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text('I have COVID symptoms & tested positive - Nasal',style: TextStyle(fontSize: 12),),
                                Spacer(),
                                IconButton(icon: Icon(Icons.check_box_outline_blank),
                                  onPressed: () {},)
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text('I have COVID symptoms, no test',style: TextStyle(fontSize: 12),),
                                Spacer(),
                                IconButton(icon: Icon(Icons.check_box_outline_blank),
                                  onPressed: () {},)
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text('I just tested negative after being positive \nand recuperating',style: TextStyle(fontSize: 12),),
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