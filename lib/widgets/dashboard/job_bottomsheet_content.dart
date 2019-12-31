import 'package:flutter/material.dart';

class JobBottomsheetContent extends StatefulWidget {
  @override
  _JobBottomsheetContentState createState() => _JobBottomsheetContentState();
}

class _JobBottomsheetContentState extends State<JobBottomsheetContent> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 1700,
        child: SizedBox(
          width: 200,
          child: DropdownButton<String>(
            value: dropdownValue,
            icon: Icon(Icons.arrow_downward),
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
            items: <String>['One', 'Two', 'Free', 'Four']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ));
  }
}
