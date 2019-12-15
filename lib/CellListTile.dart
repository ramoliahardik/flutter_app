import 'package:flutter/material.dart';

class CellListTile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("CellListTile example"),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.wb_sunny),
              title: Text("Sun"),
            ),
            ListTile(
              leading: Icon(Icons.brightness_3),
              title: Text("Moon"),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text("Star"),
            )
          ],
        )
    );
  }
}