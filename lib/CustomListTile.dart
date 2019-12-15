import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("CellListTile example"),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("images/nature.png"),
              ),
              title: Text("Sun"),
              subtitle: Text("Sun details"),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("images/nature.png"),
              ),
              title: Text("Moon"),
              subtitle: Text("Moon details"),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("images/nature.png"),
              ),
              title: Text("Star"),
              subtitle: Text("Star details"),
            )
          ],
        )
    );
  }
}