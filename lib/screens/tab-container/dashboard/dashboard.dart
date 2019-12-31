import 'package:acazia_jenkins/api/api_projects.dart';
import 'package:acazia_jenkins/entities/job.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Job> jobs = [];

  @override
  void initState() {
    super.initState();
    getProjects();
  }

  void getProjects() async {
    var resp = await ApiProjects.getProjects();
    setState(() {
      jobs = resp;
    });
    // print(resp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Container(
        child: new ListView.builder(
          itemCount: jobs.length,
          itemBuilder: (BuildContext context, int index) {
            Job item = jobs[index];

            return Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    blurRadius: 6.0,
                    spreadRadius: 1.0,
                    color: Colors.black12,
                    offset: Offset(0.1, 2))
              ]),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 24),
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context, builder: (BuildContext bc) {
                        return Container(
                          height: 1600,
                          color: Colors.yellow,
                        );
                      });
                },
                child: Text(item.name),
              ),
            );
          },
        ),
      ),
    );
  }
}
