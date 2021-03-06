import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:requests/requests.dart';


class States extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StatesState();
  }
}
class _StatesState extends State<States> {
  var _current_index = 0;
  var _state = 'ny';
  var _emoji = '';
  String _state_info_str = 'Select State';
  String _positive = '';
  String _positiveInc = '';
  String _hosp_cur = '';
  String _date = '';
  String _site = '';
  void _get_line() async {

  }

  void _get_state_current(String state) async {
    var url = "https://covidtracking.com/api/v1/states/$state/current.json";
    var r = await Requests.get(url);
    r.raiseForStatus();
    print(r.json().toString());
    setState(() {
      _positiveInc = r.json()['positiveIncrease'].toString();
      _positive = r.json()['positive'].toString();
      _hosp_cur = r.json()['hospitalizedCurrently'].toString();
    });
  }
  void _get_state(String state) async {
    var url = "https://covidtracking.com/api/v1/states/$state/info.json";
    var r = await Requests.get(url);
    r.raiseForStatus();
    var _notes = r.json()['notes'];
    print(r.json().toString());
    setState(() {
      _state = state;
      _site = r.json()['covid19Site'].toString();
      _notes = _notes.split('\n').reversed.join('\n');
      _state_info_str = _notes.replaceAll('\n', '\n\n');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 5,),
        Center(child: Text("State Level COVID Updates", style: TextStyle(fontSize: 26),),),
        Center(child: DropdownButton(
          iconSize: 25,
          hint: Text('State'),
          value: _state,
          items: <String>['ny', 'ca', 'fl', 'nj'].map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: new Text(value),
            );
          }).toList(),
          onChanged: (String state) {
            _get_state(state);
            _get_state_current(state);
            setState(() {
              _state = state;
            });
          },
        )),
        Column(children: [
          Container(
              height: 270,
              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              child:
              SingleChildScrollView(child: Text(_state_info_str, style: TextStyle(fontSize: 20),))
          ),
          SizedBox(height: 20,),
          Container(
            margin: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Positive: ', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
              Text(_positive, style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
            ],
          )),
          Container(
              margin: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Positive Increase: ', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
                  Text(_positiveInc, style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
                ],
              )),
          Container(
              margin: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Hospitalized Currently: ', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
                  Text(_hosp_cur, style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
                ],
              )),
          Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(height: 20.0,),
                  Text('Covid-19 State Website', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  SizedBox(height: 5.0,),
                  Text(_site, style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: Colors.blue),),
                ],
              )),
          ]),
      ],
    );
  }
}
















