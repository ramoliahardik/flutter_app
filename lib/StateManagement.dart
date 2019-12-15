import 'package:flutter_app/counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class StateManagementDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<Counter>(
        builder: (_) => Counter(0),
        child: StateManagementPage(),
      ),
    );
  }
}

class StateManagementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${counter.getCounter()}',
              style: Theme.of(context).textTheme.display1,
            ),
            RaisedButton(
              onPressed: counter.increment,
              textColor: Colors.white,
              child: Icon(Icons.add),
            ),
            RaisedButton(
              onPressed: counter.decrement,
              textColor: Colors.white,
              child: Icon(Icons.remove),
            ),
          ],
        ),
      )
    );
  }
}