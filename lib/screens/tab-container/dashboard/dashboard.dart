import 'package:acazia_jenkins/api/api_projects.dart';
import 'package:acazia_jenkins/entities/job.dart';
import 'package:acazia_jenkins/widgets/dashboard/item_job.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

final FirebaseMessaging firebaseMessaging = FirebaseMessaging();

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

    initFCM();
  }

  void initFCM() {
    firebaseMessaging.getToken().then((token) {
      print(token);
    });

    firebaseMessaging.configure(onMessage: (test) {
      print(test);
    });
  }

  Future<void> getProjects() async {
    var resp = await ApiProjects.getProjects();
    setState(() {
      jobs = resp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber[100],
          centerTitle: true,
          title: Image.asset(
            'assets/dora_logo.png',
            fit: BoxFit.contain,
            height: 24,
          ),
        ),
        body: Container(
          child: RefreshIndicator(
            child: new ListView.builder(
              itemCount: jobs.length,
              itemBuilder: (BuildContext context, int index) {
                Job item = jobs[index];

                return ItemJob(job: item);
              },
            ),
            onRefresh: this.getProjects,
          ),
        ));
  }
}
