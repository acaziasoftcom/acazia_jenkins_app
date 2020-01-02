import 'package:acazia_jenkins/api/api_projects.dart';
import 'package:flutter/material.dart';

class JobBottomsheetContent extends StatefulWidget {
  final String targetUrl;

  JobBottomsheetContent(this.targetUrl);

  @override
  _JobBottomsheetContentState createState() =>
      _JobBottomsheetContentState(targetUrl: targetUrl);
}

class _JobBottomsheetContentState extends State<JobBottomsheetContent> {
  final String targetUrl;
  final List<String> options = ['development', 'staging', 'production'];

  _JobBottomsheetContentState({this.targetUrl});
  String dropdownValue = 'development';

  @override
  void initState() {
    super.initState();
    ApiProjects.getProjectDetail(targetUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 1800,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 200,
              child: DropdownButton<String>(
                isExpanded: true,
                value: dropdownValue,
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 1,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                items: options.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            Padding(padding: const EdgeInsets.all(22)),
            RaisedButton(
              child: Text('Build'),
              onPressed: () {

              },
            )
          ],
        ));
  }
}
