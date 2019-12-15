import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class CupertinoDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Cupertino"),
      ),
      child: Container(
        child: Center(
          child: CupertinoButton(
            onPressed: () {
              showCupertinoDialog(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: Text("Warning"),
                      content: Text("Are you sure want to delete this data?"),
                      actions: <Widget>[
                        CupertinoDialogAction(
                          child: Text("No"),
                          onPressed: () {
                            // TODO: do something in here
                          },
                        ),
                        CupertinoDialogAction(
                          child: Text("Yes"),
                          onPressed: () {
                            // TODO: do something in here
                          },
                          isDestructiveAction: true,
                        ),
                      ],
                    );
                  });
            },
            child: Text("Tap me"),
          ),
        ),
      ),
    );
  }
}
