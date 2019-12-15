import 'package:flutter/material.dart';


class GesturePage extends StatefulWidget {
  GesturePage({Key key}) : super(key: key);

  @override
  GestureDemo createState() => new GestureDemo();

}

class GestureDemo extends State<GesturePage> {
  bool _tapInProgress;

  GestureDemo() {
    _tapInProgress = false;
  }

  void _tapDown(TapDownDetails details) {
    print("_tapDown");
  }

  void _tapUp(TapUpDetails details) {
    print("_tapUp");
  }

  void _tapCancel() {
    print("_tapCancel");
  }

  void _onTap() {
    print("_onTap");
  }

  @override
  Widget build(BuildContext context) {
    Widget redSection = new GestureDetector(
      onTapDown: _tapDown,
      onTapUp: _tapUp,
      onTap: _onTap,
      onTapCancel: _tapCancel,
      child: new Container(
        color: _tapInProgress? Colors.redAccent:Colors.red,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Text("Tap this text"),
          ],
        ),
      ),
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Gesture Detector Example"),
      ),
      body: new Padding(
        padding: new EdgeInsets.symmetric(vertical: 0.0, horizontal: 4.0),
        child: redSection,
      ),
    );
  }
}