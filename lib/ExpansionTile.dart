import 'package:flutter/material.dart';

class Websites {
  final String title;
  List<String> contents = [];
  Websites(this.title, this.contents);
}

class ExpansionListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final titles = ["Work Websites", "Social Websites"];

    List<Websites> sites = [
      new Websites("Work Websites", [
      "Stack Over flow",
      "GIT",
      "Source Tree"
      ]),
      new Websites("Social Websites", [
        "Facebook",
        "Instagram",
        "Twitter"
      ]),
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text("Expansion example"),
        ),
        body: ListView.builder(
            itemCount: sites.length,
            itemBuilder: (context, i) {
              return new ExpansionTile(
                  title: new Text(sites[i].title),
                  children: <Widget>[
                    new Column(
                      children: _buildExpansionContent(sites[i]),
                    )
                  ],
              );
            })
    );
  }
  _buildExpansionContent(Websites site) {
    List<Widget> columnContent = [];

    for(String content in site.contents) {
      columnContent.add(
        new ListTile(
          title: new Text(content)
        )
      );
    }
    return columnContent;
  }
}