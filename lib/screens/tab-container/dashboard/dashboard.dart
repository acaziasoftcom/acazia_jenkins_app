import 'package:acazia_jenkins/api/api_projects.dart';
import 'package:acazia_jenkins/entities/job.dart';
import 'package:acazia_jenkins/widgets/dashboard/job_bottomsheet_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

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
    _firebaseMessaging.getToken().then((token) {
      print(token);
    });
  }

  void getProjects() async {
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
        title: Image.asset(
          'assets/acazia_logo.png',
          fit: BoxFit.contain,
          height: 24,
        ),
      ),
      body: Container(
        child: new ListView.builder(
          itemCount: jobs.length,
          itemBuilder: (BuildContext context, int index) {
            Job item = jobs[index];

            return InkWell(
                child: Container(
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          blurRadius: 6.0,
                          spreadRadius: 1.0,
                          color: Colors.black12,
                          offset: Offset(0.1, 2))
                    ]),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 24),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                    child: Text(item.name)),
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext bc) {
                        return JobBottomsheetContent(
                            targetUrl: item.url,
                            targetName: item.name,
                            onSuccess: () {
                              Navigator.pop(bc);
                            });
                      });
                });
          },
        ),
      ),
    );
  }
}
