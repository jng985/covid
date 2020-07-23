import 'package:flutter/material.dart';
 class CategorySelector extends StatefulWidget {
   @override
   State<StatefulWidget> createState() {
     return _CategorySelectorState();
   }
 }
 class _CategorySelectorState extends State<CategorySelector> {
   int selectedIndex = 0;
   final List<String> categories = ['Chats', 'Statuses', 'Journals'];
//   double size = 24.0;
   @override
   Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: [
      Container(
      height: 90,
      color: Colors.blue,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {

              selectedIndex = index;

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
              child: RaisedButton(color: Colors.blue, onPressed: (){
//                setState(() {
//                  size = 30.0;
//                  selectedIndex = index;
//                });
              }, child: Text(categories[index], style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),)),
            );
          }),
    ),
//    [Text('what'),Text('hi'),Text('hello')][selectedIndex]
    ]);
  }
 }