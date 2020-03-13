
import 'package:flutter/material.dart';
import 'package:info_app/branches/p1';
import 'package:info_app/branches/p2';

class goto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text("Pre University Course"),
        backgroundColor: Colors.brown,
      ),
      body: new Center(
        child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
        new Text(
        "First two years of 6-years Integrated Course",
        style: new TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16.0,
        ),
        ),
    Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
            ),
         RaisedButton(
          onPressed: () {
            Navigator.of(context).push(new MaterialPageRoute(builder:(BuildContext context )=> new p1sem1()));
          },
           padding: const EdgeInsets.all(8.0),
          child: Text('PUC-1 SEM1'),
        ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).push(new MaterialPageRoute(builder:(BuildContext context )=> new p1sem2()));
              },
              padding: const EdgeInsets.all(8.0),
              child: Text('PUC-1 SEM2'),
            ),RaisedButton(
              onPressed: () {
                Navigator.of(context).push(new MaterialPageRoute(builder:(BuildContext context )=> new p2sem1()));
              },
              padding: const EdgeInsets.all(8.0),
              child: Text('PUC-2 SEM1'),
            ),
        RaisedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  p2sem2()),
            );
          },
          padding: const EdgeInsets.all(8.0),
          child: Text('PUC-2 SEM2'),
        ),
    ],
      ),
    ],
        ),
    ));
  }
}