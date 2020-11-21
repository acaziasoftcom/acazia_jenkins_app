import 'package:acazia_jenkins/api/api_projects.dart';
import 'package:flutter/material.dart';

class JobBottomsheetContent extends StatefulWidget {
  final String targetUrl;
  final String targetName;
  final Function onSuccess;

  JobBottomsheetContent({this.targetUrl, this.targetName, this.onSuccess});

  @override
  _JobBottomsheetContentState createState() => _JobBottomsheetContentState(
      targetUrl: targetUrl, targetName: targetName, onSuccess: onSuccess);
}

class _JobBottomsheetContentState extends State<JobBottomsheetContent> {
  final String targetUrl;
  final String targetName;
  final Function onSuccess;
  final List<String> options = ['development', 'staging', 'production'];

  _JobBottomsheetContentState(
      {this.targetUrl, this.targetName, this.onSuccess});
  String dropdownValue = 'development';

  @override
  void initState() {
    super.initState();
    ApiProjects.getProjectDetail(targetUrl);
  }

  void onStartBuild() async {
    var resp = await ApiProjects.buildWithParams(targetName, dropdownValue);
    if (resp.statusCode != 200 && resp.statusCode != 201) {
      return showDialog(
        context: context,
        child: new AlertDialog(
          title: new Text("Error"),
          content: new Text("Cannot start a new build"),
        ),
      );
    }
    onSuccess();
    showDialog(
      context: context,
      child: new AlertDialog(
        title: new Text("Success"),
        content: new Text("Check Jenkins CI for the build."),
      ),
    );
    return resp;
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
              this.onStartBuild();
            },
          ),
        ],
      ),
    );
  }
}
