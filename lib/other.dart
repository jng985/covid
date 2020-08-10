import 'package:flutter/material.dart';
import 'package:requests/requests.dart';


class Stock extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _StockState();
  }
}

class _StockState extends State<Stock> {
  final _ticker = 'aapl';
  String _response = '';
  void _get_options(String ticker) async {
    String baseUrl = 'https://stock-and-options-trading-data-provider.p.rapidapi.com/options/';
    Map<String, String> headers = {
      "x-rapidapi-host": "stock-and-options-trading-data-provider.p.rapidapi.com",
      "x-rapidapi-key": "7a533db627msh8a03995ecd3f6d4p10c292jsn9aaaf3c0cd3f",
      "x-rapidapi-proxy-secret": "a755b180-f5a9-11e9-9f69-7bf51e845926",
      "useQueryString": "true"
    };
    var r = await Requests.get(baseUrl + _ticker, headers: headers);
    r.raiseForStatus();
    print(r.json().toString());
    setState(() {
      _response = r.json().toString();
    });
  }



  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 50,
              child: SingleChildScrollView(
                child: Text(_response, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              )),
              RaisedButton(
                onPressed: () {
                  _get_options(_ticker);
                },
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
          width: double.infinity,)
    );
  }
}

