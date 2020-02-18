import 'package:acazia_jenkins/common/colors.dart';
import 'package:acazia_jenkins/entities/job.dart';
import 'package:acazia_jenkins/widgets/dashboard/job_bottomsheet_content.dart';
import 'package:acazia_jenkins/widgets/hex_color.dart';
import 'package:flutter/material.dart';

class ItemJob extends StatelessWidget {
  final Job job;

  ItemJob({this.job});

  HexColor getColor() {
    if (job.color.contains('red')) {
      return AJColors.TOMATO_RED;
    }
    if (job.color.contains('blue')) {
      return AJColors.LIGHT_BLUE;
    }
    return AJColors.GUNMETAL;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  blurRadius: 6.0,
                  spreadRadius: 1.0,
                  color: Colors.black12,
                  offset: Offset(0.1, 2))
            ]),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 24),
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Row(
              children: <Widget>[
                CircleAvatar(backgroundColor: getColor()),
                Padding(padding: const EdgeInsets.only(right: 22)),
                Text(job.name,
                    style:
                        TextStyle(fontSize: 16, color: AJColors.METALLIC_BLUE))
              ],
            )),
        onTap: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext bc) {
                return JobBottomsheetContent(
                    targetUrl: job.url,
                    targetName: job.name,
                    onSuccess: () {
                      Navigator.pop(bc);
                    });
              });
        });
  }
}
