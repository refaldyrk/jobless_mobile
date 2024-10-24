import 'package:flutter/material.dart';
import 'package:jobless/model/job.dart';
import 'package:jobless/styles.dart';

class JobListCard extends StatelessWidget {
  final Job job;
  const JobListCard({
    super.key,
    required this.job
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacementNamed(context, '/job_details');
      },
      child:  Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Card(
          color: primaryColor,
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: EdgeInsets.all(1.0),
            child: Padding(padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          job.title,
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        Padding(padding: EdgeInsets.only(top: 1, right: 20),
                          child: Text(job.date, style: TextStyle(fontSize: 9, color: Colors.black)),
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 0, vertical: 7),
                      child: RichText(text: TextSpan(children: [
                        WidgetSpan(child: Icon(Icons.warehouse, size: 16)),
                        TextSpan(
                          text: '  ' +job.company,
                          style: TextStyle(fontSize: 11, color: Colors.black),
                        )
                      ])),
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                      child: Text(job.location, style: TextStyle(fontSize: 10, color: Colors.grey)),
                    ),
                  ],
                )
            ),
          ),
        ),
      ),
    );
  }
}
