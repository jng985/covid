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
  bool showusers = false;
  bool showfriends = false;
  bool showlocs = false;
  var locs = [];

  List<LatLng> latlngSegment1 = List();
  List<LatLng> latlngSegment2 = List();
  static const LatLng _center = const LatLng(40.7227753, -73.89059728);
  static LatLng _lat1 = LatLng(45.1522463, -122.46522381);
  static LatLng _lat2 = LatLng(45.14563, -122.5652381);
  static LatLng _lat3 = LatLng(45.154563, -122.52362381);
  static LatLng _lat4 = LatLng(45.1543, -122.5653542381);
  static LatLng _lat5 = LatLng(45.1563, -122.56762381);
  static LatLng _lat6 = LatLng(45.152563, -122.567362381);
  BitmapDescriptor myIcon;
  BitmapDescriptor pinLocationIcon;
  BitmapDescriptor p1;
  BitmapDescriptor p2;
  BitmapDescriptor p3;
  BitmapDescriptor p4;
  BitmapDescriptor p5;
  BitmapDescriptor p6;
  BitmapDescriptor p7;
  BitmapDescriptor p8;
  BitmapDescriptor p9;
  BitmapDescriptor positive;
  BitmapDescriptor negative;

  Set<Circle> circles = {
    Circle(
        circleId: CircleId(_center.toString()),
        radius: 175,
        center: _center,
        fillColor: Color.fromRGBO(0, 0, 255, 0.3),
        strokeColor: Color.fromRGBO(0, 0, 255, 0.6),
        onTap: () {
          print('circle pressed');
        }),
  };
  Set<Marker> _markers = {};
  List<Color> _status_colors = [];
  List<String> _statuses = [];
  var users = [
    LatLng(40.848858310783946, -73.8933975884892),
    LatLng(40.789140383710894, -73.82616723460617),
    LatLng(40.8453051400937, -73.83922301607542),
    LatLng(40.75891889121061, -73.84414822360101),
//    LatLng(40.79988466632752, -73.87677032884994),
    LatLng(40.78336884805268, -73.83451028898179),
//    LatLng(40.790876092849324, -73.86922281427844),
//    LatLng(40.79486896421356, -73.81725111073163),
    LatLng(40.750000313578006, -73.87122594675208),
    LatLng(40.84627599731396, -73.8515810349051),
    LatLng(40.77288660810042, -73.80784527972853),
    LatLng(40.75366271020636, -73.86130791557021),
//    LatLng(40.80058573746199, -73.83556667804511),
    LatLng(40.788768247376986, -73.90202095012134),
    LatLng(40.767762433511706, -73.87360748411066),
    LatLng(40.827564014384826, -73.91960769802289),
//    LatLng(40.895834972931155, -73.8513951151164),
    LatLng(40.89433627847908, -73.88526213782846),
//    LatLng(40.8782562388741, -73.91566761329139),
    LatLng(40.89586213526583, -73.8646113450983),
    LatLng(40.82147340291724, -73.84215575573977),
    LatLng(40.86029546882902, -73.86718400122095),
    LatLng(40.81863046553684, -73.86966351758927),
    LatLng(40.80372105084089, -73.88735856106479),
    LatLng(40.83058378486659, -73.91187121497698),
    LatLng(40.82371231757554, -73.84448567640742),
    LatLng(40.797869257166035, -73.91489498545756),
    LatLng(40.85835113759067, -73.91634841476265),
    LatLng(40.818321739551024, -73.91359976346533),
    LatLng(40.86470247384568, -73.90923931846204),
//    LatLng(40.771022125873884, -73.93689646354002),
    LatLng(40.803496006276724, -73.90650616058568),
    LatLng(40.74073218360696, -73.95433364833535),
//    LatLng(40.83670315711793, -73.95694070854627),
    LatLng(40.767784317872895, -73.89284871713842),
    LatLng(40.73909834759883, -73.98519946826995),
    LatLng(40.756460467240714, -73.96630656532693),
    LatLng(40.80093516645216, -73.93731349516999),
//    LatLng(40.740957770517696, -73.90245252065974),
    LatLng(40.78484289602401, -73.89923828627335),
//    LatLng(40.782633987739146, -73.89404969727718),
    LatLng(40.82886005764339, -73.90676771498563),
    LatLng(40.791889393478414, -73.90579182920172),
    LatLng(40.77339646790257, -73.90349454443098),
    LatLng(40.81613336949952, -73.89330490842362),
//    LatLng(40.75711520944686, -73.95479777665355),
    LatLng(40.77770656838148, -73.88427649655867),
    LatLng(40.704193104468196, -73.93896299094399),
    LatLng(40.76389603815116, -73.90016703660103),
    LatLng(40.777009023377964, -73.9485261905042),
    LatLng(40.71216889491881, -73.9207926185063),
    LatLng(40.74500697034935, -73.95074940314504),
    LatLng(40.68942925134737, -73.88295173829187),
    LatLng(40.69804691781419, -73.89599010759214),
    LatLng(40.71258237694674, -73.87291337858558),
    LatLng(40.72456238914721, -73.92112726730643),
    LatLng(40.779990593326744, -73.95408584392236),
    LatLng(40.68796621156763, -73.90759065439575),
    LatLng(40.68818575948853, -73.80342438972944),
    LatLng(40.745495178330536, -73.7979199286816),
    LatLng(40.68244958432358, -73.82866097381768),
    LatLng(40.74147562343905, -73.84523169615262),
    LatLng(40.703553816446394, -73.82753620098603),
    LatLng(40.70161219530556, -73.85317947570769),
    LatLng(40.70671217935915, -73.88798258860876),
    LatLng(40.76044201790334, -73.88398014280642),
    LatLng(40.72199333992041, -73.83529624118366),
    LatLng(40.70599542748784, -73.81047139353478),
    LatLng(40.76227704062569, -73.87915992380479),
    LatLng(40.66900150549131, -73.89254605258704),
    LatLng(40.66790578912877, -73.80270735837689),
    LatLng(40.66583514994219, -73.85467999860707),
    LatLng(40.69770939738991, -73.81458861232892),
  ];
  var reds = [
    LatLng(40.69102596428577, -73.92117534082277),
    LatLng(40.66576767532661, -73.92358926374891),
    LatLng(40.73482829396579, -73.84543825234786),
    LatLng(40.668005909515315, -73.8721481565122),
    LatLng(40.72330849266084, -73.92974007108897),
    LatLng(40.691706768316074, -73.82553204815028),
    LatLng(40.65667538398659, -73.8686132963494),
    LatLng(40.765502218533946, -73.9068965944661),
    LatLng(40.67783327093361, -73.88185299341073),
    LatLng(40.68903453729557, -73.82050852601688),
    LatLng(40.68518311934877, -73.91907335977902),
    LatLng(40.74626999190879, -73.83286841505085),
    LatLng(40.6762630028701, -73.84574197061936),
    LatLng(40.708880954190455, -73.94033622854612),
    LatLng(40.64781932307425, -73.89287399775696),
    LatLng(40.648968907565184, -73.85002283067068),
    LatLng(40.75769037788687, -73.8527029330595),
    LatLng(40.70000398996724, -73.8937650829465),
    LatLng(40.698822514195456, -73.86831951259374),
    LatLng(40.67170167308708, -73.92156561101679),
    LatLng(40.75534056539804, -73.92768472549601),
    LatLng(40.71940746217762, -73.85048948748369),
    LatLng(40.69489345704011, -73.83472758612295),
    LatLng(40.66594170727986, -73.90458591350196),
    LatLng(40.628681250870606, -73.9442558026548),
    LatLng(40.63739817128739, -73.90377163987968),
    LatLng(40.6373120366759, -73.92016679941052),
    LatLng(40.64682650918, -74.00981108765605),
    LatLng(40.68417420365876, -73.93540426646202),
    LatLng(40.66582019470213, -73.9802706687584),
    LatLng(40.60942712166221, -74.00946200559474),
    LatLng(40.613858588220715, -73.98111869923652),
    LatLng(40.61950138908471, -73.97316777924854),
    LatLng(40.66738516915166, -73.92889990462896),
    LatLng(40.601862035217295, -74.01055623133851),
    LatLng(40.60824307879402, -73.97815343811665),
    LatLng(40.604602242600706, -73.9961530228216),
    LatLng(40.64111187269958, -73.94846616888518),
    LatLng(40.64096068996144, -73.95340495421173),
    LatLng(40.64420019767585, -73.99029040224123),
    LatLng(40.68507675279591, -73.93480140506198),
    LatLng(40.621157548762405, -73.91294874420949),
    LatLng(40.65723979791275, -73.92981463716288),
  ];
  var greens = [
    LatLng(40.73697455987562, -73.79066975655073),
    LatLng(40.702483729477564, -73.7949584844296),
    LatLng(40.7035562515836, -73.75501081515024),
    LatLng(40.70159209904699, -73.81668546906376),
    LatLng(40.712777445820954, -73.81464128291768),
    LatLng(40.73205586231742, -73.75345001245009),
    LatLng(40.74465548487124, -73.7656948851885),
    LatLng(40.737108047987455, -73.80517449214581),
    LatLng(40.69888101749554, -73.80077076805539),
    LatLng(40.745884091516224, -73.78358657047058),
    LatLng(40.72995075228218, -73.7723613081393),
    LatLng(40.68578002106631, -73.78486720763202),
    LatLng(40.715711839639994, -73.80035641600959),
    LatLng(40.71688297489361, -73.8081503945927),
    LatLng(40.70237426178289, -73.79662855042443),
    LatLng(40.71837272751477, -73.7995303375353),
    LatLng(40.71791157288381, -73.8046284320201),
    LatLng(40.68893787222211, -73.76157999855198),
    LatLng(40.73513336482945, -73.75919135302807),
    LatLng(40.695959005920784, -73.79446288847356),
    LatLng(40.74119514925712, -73.8166459284352),
    LatLng(40.68965140770871, -73.75424432706761),
    LatLng(40.68637331895058, -73.75517271231087),
    LatLng(40.71484913511256, -73.78718571728633),
    LatLng(40.715130974373615, -73.76665119312119),
  ];
  var circle1 = [
    LatLng(40.74954981676281, -73.90628255903721),
    LatLng(40.796220786485804, -73.93868934363127),
    LatLng(40.73831974204038, -73.986997269094),
    LatLng(40.684836458842746, -73.97279765456915),
    LatLng(40.66284774739407, -73.89585681259632)
  ];

  @override
  void initState() {

    BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(48, 48)), 'assets/plus.jpg')
        .then((onValue) {
      myIcon = onValue;
    });
    BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(48, 48)), 'assets/p1.jpg')
        .then((onValue) {
      p1 = onValue;
    });
    BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(48, 48)), 'assets/p2.jpg')
        .then((onValue) {
      p2 = onValue;
    });
    BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(48, 48)), 'assets/p3.jpg')
        .then((onValue) {
      p3 = onValue;
    });
    BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(48, 48)), 'assets/p4.jpg')
        .then((onValue) {
      p4 = onValue;
    });
    BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(48, 48)), 'assets/p5.jpg')
        .then((onValue) {
      p5 = onValue;
    });
    BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(48, 48)), 'assets/p6.jpg')
        .then((onValue) {
      p6 = onValue;
    });

    BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(12, 12)), 'assets/positive.jpg')
        .then((onValue) {
      positive = onValue;
    });
    BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(12, 12)), 'assets/negative.jpg')
        .then((onValue) {
      negative = onValue;
    });

  }
  LatLng _lastMapPosition = _center;
  void setCustomMapPin() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'assets/plus.png');

  }
  void show_users() {

    setState(() {
      for (int i = 0; i < users.length; i++) {
        print(users[i]);
        var posneg = positive;
        String my_snippet = 'I have COVID symptons, no test';
        if (i%2==0) {
          print(i);
          posneg = negative;
          my_snippet = 'I tested negative for COVID - Antibodies';
        }

        _markers.add(Marker(
          // This marker id can be anything that uniquely identifies each marker.
          markerId: MarkerId(users[i].toString()),
          position: users[i],
          infoWindow: InfoWindow(
            title: "Anonymous",
            snippet: my_snippet,
          ),
//        icon: pinLocationIcon,
          icon: posneg,
//      icon: BitmapDescriptor.defaultMarker,
        )
        );
      };
      for (int i = 0; i < reds.length; i++) {
        print(reds[i]);
        String my_snippet = 'I have COVID symptons, no test';
        var posneg = positive;
//        if (i%2==0) {
//          print(i);
//          posneg = negative;
//        }

        _markers.add(Marker(
          // This marker id can be anything that uniquely identifies each marker.
          markerId: MarkerId(reds[i].toString()),
          position: reds[i],
          infoWindow: InfoWindow(
            title: "Anonymous",
            snippet: my_snippet,
          ),
//        icon: pinLocationIcon,
          icon: posneg,
//      icon: BitmapDescriptor.defaultMarker,
        )
        );
      };
      for (int i = 0; i < greens.length; i++) {
        print(greens[i]);
        String my_snippet = 'I have COVID symptons, no test';
        var posneg = negative;
//        if (i%2==0) {
//          print(i);
//          posneg = negative;
//        }

        _markers.add(Marker(
          // This marker id can be anything that uniquely identifies each marker.
          markerId: MarkerId(greens[i].toString()),
          position: greens[i],
          infoWindow: InfoWindow(
            title: "Anonymous",
            snippet: my_snippet,
          ),
//        icon: pinLocationIcon,
          icon: posneg,
//      icon: BitmapDescriptor.defaultMarker,
        )
        );
      };
    });
  }
  void show_testing_locations() {
    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(LatLng(40.76983966458111, -73.95541090518236).toString()),
        position: LatLng(40.76983966458111, -73.95541090518236),
        infoWindow: InfoWindow(
          title: 'COVID Testing Center',
          snippet: 'Address: ____________    Phone: 012-345-6789',
        ),
//        icon: pinLocationIcon,
        icon: myIcon,
//      icon: BitmapDescriptor.defaultMarker,
      )
      );

      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(LatLng(40.7227753, -73.9059728).toString()),
        position: LatLng(40.7227753, -73.8759728),
        infoWindow: InfoWindow(
          title: 'COVID Testing Center',
          snippet: 'Address: ____________    Phone: 012-345-6789',
        ),
//        icon: pinLocationIcon,
        icon: myIcon,
//      icon: BitmapDescriptor.defaultMarker,
      )
      );
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(LatLng(40.700757745451206, -73.92983838915825).toString()),
        position: LatLng(40.700757745451206, -73.92983838915825),
        infoWindow: InfoWindow(
          title: 'COVID Testing Center',
          snippet: 'Address: ____________    Phone: 012-345-6789',
        ),
//        icon: pinLocationIcon,
        icon: myIcon,
//      icon: BitmapDescriptor.defaultMarker,
      )
      );
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(LatLng(40.72669419861919, -73.9969315007329).toString()),
        position: LatLng(40.72669419861919, -73.9969315007329),
        infoWindow: InfoWindow(
          title: 'COVID Testing Center',
          snippet: 'Address: ____________    Phone: 012-345-6789',
        ),
//        icon: pinLocationIcon,
        icon: myIcon,
//      icon: BitmapDescriptor.defaultMarker,
      )
      );
    });
  }
  void show_friends() {
    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(circle1[0].toString()),
        position: circle1[0],
        infoWindow: InfoWindow(
          title: 'Viki',
          snippet: 'I have covid antibodies',
        ),
//        icon: pinLocationIcon,
        icon: p1,
//      icon: BitmapDescriptor.defaultMarker,
      )
      );
      circles.add(Circle(
          circleId: CircleId(circle1[0].toString()),
          radius: 450,
          center: circle1[0],
          fillColor: Color.fromRGBO(0, 255, 0, 0.3),
          strokeColor: Color.fromRGBO(0, 255, 0, 0.8),
          onTap: () {
            print('circle pressed');
          }));
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(circle1[1].toString()),
        position: circle1[1],
        infoWindow: InfoWindow(
          title: 'Matthew',
          snippet: 'I tested positive for COVID - Nasal',
        ),
//        icon: pinLocationIcon,
        icon: p3,
//      icon: BitmapDescriptor.defaultMarker,
      )
      );
      circles.add(Circle(
          circleId: CircleId(circle1[1].toString()),
          radius: 450,
          center: circle1[1],
          fillColor: Color.fromRGBO(255, 0, 0, 0.3),
          strokeColor: Color.fromRGBO(255, 0, 0, 0.8),
          onTap: () {
            print('circle pressed');
          }));
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(circle1[2].toString()),
        position: circle1[2],
        infoWindow: InfoWindow(
          title: 'Alicja',
          snippet: 'I just tested negative after being positive and recuperating',
        ),
//        icon: pinLocationIcon,
        icon: p4,
//      icon: BitmapDescriptor.defaultMarker,
      )
      );
      circles.add(Circle(
          circleId: CircleId(circle1[2].toString()),
          radius: 450,
          center: circle1[2],
          fillColor: Color.fromRGBO(0, 255, 0, 0.3),
          strokeColor: Color.fromRGBO(0, 255, 0, 0.8),
          onTap: () {
            print('circle pressed');
          }));
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(circle1[3].toString()),
        position: circle1[3],
        infoWindow: InfoWindow(
          title: 'Jhon',
          snippet: 'I have COVID symptons, no test',
        ),
//        icon: pinLocationIcon,
        icon: p6,
//      icon: BitmapDescriptor.defaultMarker,
      )
      );
      circles.add(Circle(
          circleId: CircleId(circle1[3].toString()),
          radius: 450,
          center: circle1[3],
          fillColor: Color.fromRGBO(255, 0, 0, 0.3),
          strokeColor: Color.fromRGBO(255, 0, 0, 0.8),
          onTap: () {
            print('circle pressed');
          }));

    });
  }

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
      locs.add(_lastMapPosition);
      print(locs);
//      circles.add(Circle(
//          circleId: CircleId(_lastMapPosition.toString()),
//          radius: 500,
//          center: _lastMapPosition,
//          fillColor: Color.fromRGBO(171, 39, 133, 0.1),
//          strokeColor: Color.fromRGBO(171, 39, 133, 0.5),
//          onTap: () {
//            print('circle pressed');
//          }));
      latlngSegment1.add(_lastMapPosition);
//      latlngSegment1.add(LatLng(45.1543, -122.5453542381));
      setCustomMapPin();
      print(pinLocationIcon);
//      _polylines.add(Polyline(
//        polylineId: PolylineId('line1'),
//        visible: true,
//        //latlng is List<LatLng>
//        points: latlngSegment1,
//        width: 4,
//        color: Colors.blue,
//      ));
//      _addLine(LatLng(40.712775122806555, -74.00597155094147), _lastMapPosition);
      print(_lastMapPosition);
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: 'Anonymous',
          snippet: 'I have COVID symptoms & tested positive',
        ),
//        icon: pinLocationIcon,
//        icon: BitmapDescriptor.defaultMarker,
      icon: positive,
//        alpha: 50,
      ));
    });
//    show_friends();
  }
  void _onAddMarkerButtonRedPressed() {
    setState(() {

      latlngSegment1.add(_lastMapPosition);
//      latlngSegment1.add(LatLng(45.1543, -122.5453542381));
      setCustomMapPin();
      print(pinLocationIcon);
//      _polylines.add(Polyline(
//        polylineId: PolylineId('line1'),
//        visible: true,
//        //latlng is List<LatLng>
//        points: latlngSegment1,
//        width: 4,
//        color: Colors.red,
//      ));
//      _addLine(LatLng(40.712775122806555, -74.00597155094147), _lastMapPosition);
      print(_lastMapPosition);
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: 'Anonymous',
          snippet: 'I have COVID symptoms & tested positive',
        ),
//        icon: pinLocationIcon,
//        icon: BitmapDescriptor.defaultMarker,
        icon: negative,
//        alpha: 50,
      ));
    });
  }
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _req_location();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
        children:[
          Container(height:530,
          child: GoogleMap(
              circles: circles,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: 200,
                height: 40,
                child: RaisedButton(
                  child: Text('Show Users', style: TextStyle(fontSize: 24, color: Colors.white),),
                  onPressed: () {
                    show_users();
//                    _onAddMarkerButtonPressed();
//                    show_friends();
//                    show_testing_locations();
                  },
                  color: Colors.blue,
                ),),
              Container(
                margin: EdgeInsets.all(20.0),
                height: 40,
                child: RaisedButton(
                  child: Text('Show Friends', style: TextStyle(color: Colors.white, fontSize: 24),),
                  color: Colors.blue,
                  onPressed: (){
                    show_friends();
//                    _onAddMarkerButtonRedPressed();
                  },
                ),
              ),

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

              Container(
                width: 200,
                height: 40,
                child: RaisedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Image.asset('assets/plus.jpg', width: 30, height: 30,),
                      Text('Get Tested', style: TextStyle(fontSize: 24, color: Colors.white),),
                    ],
                  ),
                  onPressed: () {
                    show_testing_locations();
//                    _onAddMarkerButtonRedPressed();
                  },
                  color: Colors.redAccent,
                ),),
              Container(
                width: 200,
                height: 40,
                child: RaisedButton(
                  child: Text('Update Status', style: TextStyle(fontSize: 24, color: Colors.white),),
                  onPressed: () {
//                    _onAddMarkerButtonPressed();
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                            elevation: 16,
                            child: Container(
                                height: 550,
                                width: 360,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Text('My Status', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                                      Row(
                                        children: <Widget>[
                                          Text('I tested positive for COVID\n - Nasal',style: TextStyle(fontSize: 16),),
                                          Spacer(),
                                          IconButton(icon: Icon(Icons.check_box_outline_blank),
                                            onPressed: () {},)
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text('I have COVID antibodies',style: TextStyle(fontSize: 16),),
                                          Spacer(),
                                          IconButton(icon: Icon(Icons.check_box_outline_blank),
                                            onPressed: () {},)
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text('I tested negative for COVID\n - Nasal',style: TextStyle(fontSize: 16),),
                                          Spacer(),
                                          IconButton(icon: Icon(Icons.check_box_outline_blank),
                                            onPressed: () {},)
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text('I tested negative for COVID\n - Antibodies',style: TextStyle(fontSize: 16),),
                                          Spacer(),
                                          IconButton(icon: Icon(Icons.check_box_outline_blank),
                                            onPressed: () {},)
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text('I have COVID symptoms\n & tested positive - Nasal',style: TextStyle(fontSize: 16),),
                                          Spacer(),
                                          IconButton(icon: Icon(Icons.check_box_outline_blank),
                                            onPressed: () {},)
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text('I have COVID symptoms, no test',style: TextStyle(fontSize: 16),),
                                          Spacer(),
                                          IconButton(icon: Icon(Icons.check_box_outline_blank),
                                            onPressed: () {},)
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text('I just tested negative after\n being positive and recuperating',style: TextStyle(fontSize: 16),),
                                          Spacer(),
                                          IconButton(icon: Icon(Icons.check_box_outline_blank),
                                            onPressed: () {},)
                                        ],
                                      ),
//                            SizedBox(height: 100,),
//                            IconButton(icon: Icon(Icons.check_circle),
//                              iconSize: 50,
//                              onPressed: () {},),
                                    ],
                                  ),
                                )
                            ),
                          );
                        }
                    );
                  },
                  color: Colors.green,
                ),),
            ],
          ),

//          SizedBox(height: 100,),
//          Row(
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//            children: <Widget>[
////              Text('Update Status', style: TextStyle(fontSize: 24, color: Colors.black),),
//              FloatingActionButton(
//                child: Icon(Icons.add_circle),
//                backgroundColor: Colors.green,
//                onPressed: () {
//                  showDialog(
//                      context: context,
//                      builder: (context) {
//                        return Dialog(
//                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
//                          elevation: 16,
//                          child: Container(
//                              height: 550,
//                              width: 360,
//                              child: Padding(
//                                padding: const EdgeInsets.all(10),
//                                child: Column(
//                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                  children: <Widget>[
//                                    Text('My Status', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
//                                    Row(
//                                      children: <Widget>[
//                                        Text('I tested positive for COVID\n - Nasal',style: TextStyle(fontSize: 16),),
//                                        Spacer(),
//                                        IconButton(icon: Icon(Icons.check_box_outline_blank),
//                                          onPressed: () {},)
//                                      ],
//                                    ),
//                                    Row(
//                                      children: <Widget>[
//                                        Text('I have COVID antibodies',style: TextStyle(fontSize: 16),),
//                                        Spacer(),
//                                        IconButton(icon: Icon(Icons.check_box_outline_blank),
//                                          onPressed: () {},)
//                                      ],
//                                    ),
//                                    Row(
//                                      children: <Widget>[
//                                        Text('I tested negative for COVID\n - Nasal',style: TextStyle(fontSize: 16),),
//                                        Spacer(),
//                                        IconButton(icon: Icon(Icons.check_box_outline_blank),
//                                          onPressed: () {},)
//                                      ],
//                                    ),
//                                    Row(
//                                      children: <Widget>[
//                                        Text('I tested negative for COVID\n - Antibodies',style: TextStyle(fontSize: 16),),
//                                        Spacer(),
//                                        IconButton(icon: Icon(Icons.check_box_outline_blank),
//                                          onPressed: () {},)
//                                      ],
//                                    ),
//                                    Row(
//                                      children: <Widget>[
//                                        Text('I have COVID symptoms\n & tested positive - Nasal',style: TextStyle(fontSize: 16),),
//                                        Spacer(),
//                                        IconButton(icon: Icon(Icons.check_box_outline_blank),
//                                          onPressed: () {},)
//                                      ],
//                                    ),
//                                    Row(
//                                      children: <Widget>[
//                                        Text('I have COVID symptoms, no test',style: TextStyle(fontSize: 16),),
//                                        Spacer(),
//                                        IconButton(icon: Icon(Icons.check_box_outline_blank),
//                                          onPressed: () {},)
//                                      ],
//                                    ),
//                                    Row(
//                                      children: <Widget>[
//                                        Text('I just tested negative after\n being positive and recuperating',style: TextStyle(fontSize: 16),),
//                                        Spacer(),
//                                        IconButton(icon: Icon(Icons.check_box_outline_blank),
//                                          onPressed: () {},)
//                                      ],
//                                    ),
//                                  ],
//                                ),
//                              )
//                          ),
//                        );
//                      }
//                  );
//                },
//              )
//            ],
//          ),
//          FloatingActionButton(
//            child: Icon(Icons.add_circle),
//            backgroundColor: Colors.green,
//            onPressed: () {
//              showDialog(
//                context: context,
//                builder: (context) {
//                  return Dialog(
//                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
//                    elevation: 16,
//                    child: Container(
//                      height: 550,
//                      width: 360,
//                      child: Padding(
//                        padding: const EdgeInsets.all(10),
//                        child: Column(
//                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                          children: <Widget>[
//                            Text('My Status', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
//                            Row(
//                              children: <Widget>[
//                                Text('I tested positive for COVID\n - Nasal',style: TextStyle(fontSize: 16),),
//                                Spacer(),
//                                IconButton(icon: Icon(Icons.check_box_outline_blank),
//                                onPressed: () {},)
//                              ],
//                            ),
//                            Row(
//                              children: <Widget>[
//                                Text('I have COVID antibodies',style: TextStyle(fontSize: 16),),
//                                Spacer(),
//                                IconButton(icon: Icon(Icons.check_box_outline_blank),
//                                  onPressed: () {},)
//                              ],
//                            ),
//                            Row(
//                              children: <Widget>[
//                                Text('I tested negative for COVID\n - Nasal',style: TextStyle(fontSize: 16),),
//                                Spacer(),
//                                IconButton(icon: Icon(Icons.check_box_outline_blank),
//                                  onPressed: () {},)
//                              ],
//                            ),
//                            Row(
//                              children: <Widget>[
//                                Text('I tested negative for COVID\n - Antibodies',style: TextStyle(fontSize: 16),),
//                                Spacer(),
//                                IconButton(icon: Icon(Icons.check_box_outline_blank),
//                                  onPressed: () {},)
//                              ],
//                            ),
//                            Row(
//                              children: <Widget>[
//                                Text('I have COVID symptoms\n & tested positive - Nasal',style: TextStyle(fontSize: 16),),
//                                Spacer(),
//                                IconButton(icon: Icon(Icons.check_box_outline_blank),
//                                  onPressed: () {},)
//                              ],
//                            ),
//                            Row(
//                              children: <Widget>[
//                                Text('I have COVID symptoms, no test',style: TextStyle(fontSize: 16),),
//                                Spacer(),
//                                IconButton(icon: Icon(Icons.check_box_outline_blank),
//                                  onPressed: () {},)
//                              ],
//                            ),
//                            Row(
//                              children: <Widget>[
//                                Text('I just tested negative after\n being positive and recuperating',style: TextStyle(fontSize: 16),),
//                                Spacer(),
//                                IconButton(icon: Icon(Icons.check_box_outline_blank),
//                                  onPressed: () {},)
//                              ],
//                            ),
////                            SizedBox(height: 100,),
////                            IconButton(icon: Icon(Icons.check_circle),
////                              iconSize: 50,
////                              onPressed: () {},),
//                          ],
//                        ),
//                      )
//                    ),
//                  );
//                }
//              );
//            },
//          )
        ]
    );
  }
}