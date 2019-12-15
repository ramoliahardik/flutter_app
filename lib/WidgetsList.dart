import 'package:flutter/material.dart';

class WidgetsList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widgets example"),
      ),
      body: Column(
        children: <Widget>[
          Row(children: <Widget>[
            Image.asset("images/nature.png"),
            Text("Text Row example")
          ],),
          Image.asset("images/nature.png"),
          Text("Text Column example"),
          RaisedButton(
            onPressed: () {},
            textColor: Colors.white,
            child: Text("Button"),
              ),
          RaisedButton(
            onPressed: () {showDialogAlert(context); },
            textColor: Colors.white,
            child: Text("Alert"),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text("Home")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.message),
                title: Text("Message")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text("Profile")
            )
          ],
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showBottomSheets(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  showDialogAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Alert Example"),
            content: Text("this is a body text"),
            actions: <Widget>[
              FlatButton(onPressed: () { Navigator.of(context).pop(); }, child: Text("OK")),
              FlatButton(onPressed: () { Navigator.of(context).pop(); }, child: Text("Cancel"))
            ],
          );
        }
    );
  }

  _showBottomSheets(BuildContext context) {
    showBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.music_note),
                  title: Text("Music"),
                  onTap: () {},
                )
              ],
            ),
          );
        }
    );
  }
}